<template>
    <label @drop='drop' @dragover='dragover' class='h-full w-full'>
        <app-image :src='url'/>
        <input
            type="file"
            id='image'
            ref='image'
            accept='.jpg,.jpeg,.png'
            @change='handleImage'
            class='hidden'
            :disabled='disabled'
        />
    </label>
</template>

<script>
import AppImage from './AppImage'
import Compressor from 'compressorjs'

export default {
    name: 'ImageUploader',
    components: { AppImage },

    props: { disabled: Boolean },

    data: function () {
        return {
            url: '',
            max_res: 1024,
            max_size: 5 * 1024 * 1024,
            ori_width: null,
            ori_height: null,
        }
    },

    mounted() {
        // Pulls the most up-tp-date API accepted max resolution
        this.$axios.get(
            process.env.VUE_APP_API_URL,
        ).then((response) => {
            this.max_res = response.data.max_image_res;
            this.max_size = response.data.max_image_size;
        });
    },

    methods: {
        handleImage() {
            let image = this.$refs.image.files[0];

            if(!image) {
                this.resetInput();
                this.$emit('error', 'file unload')
                return;
            }

            if(!this.isImage(image)) {
                this.resetInput();
                this.$emit('error', 'invalid file type');
                return;
            }

            // Extracts the original image size
            let self = this
            var fr = new FileReader;
            fr.onload = () => {
                var img = new Image;
                img.onload = () => {
                    self.ori_width = img.width;
                    self.ori_height = img.height;
                };
                img.src = fr.result;
            };
            fr.readAsDataURL(image);

            // Compress the image limiting resolution too
            new Compressor(image, {
                strict: false,
                maxWidth: this.max_res,
                maxHeight: this.max_res,
                success: (resultImage) => {
                    // Check if the compressed size is accepted by the api
                    if(resultImage.size > this.max_size) {
                        this.resetInput();
                        this.$emit('error', 'image too big', this.max_size / (1024 * 1024));
                        return;
                    }

                    this.url = URL.createObjectURL(resultImage);
                    this.$emit('load', this.url)
                    this.uploadImage(resultImage)
                },
                error: (err) => {
                    console.log(err);
                    this.$emit('error', 'image error');
                },
            });
        },

        uploadImage(image) {
            let formData = new FormData();
            formData.append('image', image);

            this.$axios.post(
                process.env.VUE_APP_API_URL + 'inference/',
                formData,
                { headers: { 'Content-Type': 'multipart/form-data' }},
            ).then((response) => {
                let data = response.data;

                // Push extra data into the response
                data.image_name = image.name;
                data.original_width = this.ori_width;
                data.original_height = this.ori_height;

                this.$emit('upload', data);
            }).catch((error) => {
                if(error.response.status == 429) {
                    this.$emit('error', 'too many requests');
                } else {
                    this.$emit('error', 'server error');
                }
                this.resetInput();
            });
        },

        isImage(file) {
            const acceptedImageTypes = ['image/jpeg', 'image/png'];
            return file && acceptedImageTypes.includes(file['type'])
        },

        drop(event) {
            event.preventDefault();
            this.$refs.image.files = event.dataTransfer.files;
            this.handleImage();
        },

        dragover(event) {
            event.preventDefault();
        },

        resetInput() {
            this.url = '';
            const input = this.$refs.image;
            input.type = 'text';
            input.type = 'file';
        },
    }
}
</script>