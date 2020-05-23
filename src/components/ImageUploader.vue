<template>
    <label @drop='drop' @dragover='dragover' class='h-full'>
        <app-image :src='url'/>
        <input
            type="file"
            id='image'
            ref='image'
            accept='.jpg,.jpeg,.png'
            @change='handleImage'
            class='hidden'
        />
    </label>
</template>

<script>
import AppImage from './AppImage'

export default {
    name: 'ImageUploader',
    components: { AppImage },

    data: function () {
        return {
            url: '',
        }
    },

    methods: {
        handleImage() {
            let image = this.$refs.image.files[0];

            if(!image) {
                this.url = '';
                this.$emit('error', 'File Discharged')
                return;
            }

            if(!this.isImage(image)) {
                this.url = '';
                this.$emit('error', 'Invalid File Type');
                return;
            }

            this.url = URL.createObjectURL(image);
            this.$emit('load')
            this.uploadImage(image)
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
                this.$emit('error', 'There was an Error on the Server');
                this.url = '';
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
    }
}
</script>