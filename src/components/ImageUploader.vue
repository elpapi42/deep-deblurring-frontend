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
        }
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

            if(image.size > 3162 * 3162) {
                this.resetInput();
                this.$emit('error', 'image too big');
                return;
            }

            // Compress the image limiting resolution too
            new Compressor(image, {
                strict: false,
                maxWidth: 1024,
                maxHeight: 1024,
                success: (resultImage) => {
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
                process.env.VUE_APP_API_URL + '/inference/',
                formData,
                { headers: { 'Content-Type': 'multipart/form-data' }},
            ).then((response) => {
                let data = response.data;
                data.image_name = image.name;
                this.$emit('upload', data);
            }).catch(() => {
                this.$emit('error', 'server error');
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