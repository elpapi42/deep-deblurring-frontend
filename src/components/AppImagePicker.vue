<template>
    <label @drop='drop' @dragover='dragover' class='w-full h-full'>
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
    name: 'AppImagePicker',
    components: { AppImage },

    data: function () {
        return {
            image: null,
            url: '',
        }
    },

    methods: {
        handleImage() {
            this.image = this.$refs.image.files[0];

            if(!this.image) {
                this.url = '';
                this.image = null;
                this.$emit('error', 'File Discharged')
                return;
            }

            if(!this.isFileImage(this.image)) {
                this.url = '';
                this.image = null;
                this.$emit('error', 'Invalid File Type');
                return;
            }
            
            this.url = URL.createObjectURL(this.image);
            this.uploadImage()
            this.$emit('load', this.image.name)
        },

        uploadImage() {
            if(!this.image) { return; }

            let formData = new FormData();
            formData.append('image', this.image);

            this.$axios.post(
                process.env.VUE_APP_API_URL + '/inference/',
                formData,
                { headers: { 'Content-Type': 'multipart/form-data' }},
            ).then((response) => {
                this.$emit('upload', response.data)
            }).catch(() => {
                this.$emit('error', 'There was an Error on the Server');
                this.url = '';
            });
        },

        isFileImage(file) {
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