<template>
    <div @drop='drop' @dragover='dragover' class='w-full h-full'>
        <label>
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
    </div>
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
                this.$emit('error', 'file discharged')
                return;
            }

            if(!this.isFileImage(this.image)) {
                this.url = '';
                this.image = null;
                this.$emit('error', 'invalid file')
                alert('Invalid File');
                return;
            }
            
            this.url = URL.createObjectURL(this.image);
            this.$emit('load', this.image)
            return;
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