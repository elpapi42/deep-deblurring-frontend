<template>
    <div class='grid grid-cols-1 sm:grid-cols-2 gap-2 h-full'>
        <image-uploader @load='onLoad' @error='onError' @upload='onUpload'/>
        <image-downloader :src='outputUrl' :name='imageName' :loading='loading'/>
    </div>
</template>

<script>
import ImageUploader from './ImageUploader'
import ImageDownloader from './ImageDownloader'

export default {
    name: 'AppProcessor',
    components: { ImageUploader, ImageDownloader },

    data: function () {
        return {
            outputUrl: '',
            imageName: '',
            loading: false,
        }
    },

    computed: {
    },

    methods: {
        onError(error) {
            this.outputUrl = '';
            this.imageName = '';
            this.loading = false;
            this.notify(error, 'red');
        },

        onLoad() {
            this.loading = true;
            this.notify('Uploading Image to the Server', 'green');
        },

        onUpload(response) {
            this.outputUrl = response.output_image;
            this.imageName = response.image_name;
            this.loading = false;
            this.$emit('upload', { url: this.outputUrl, name: this.imageName, uuid: response.resource_id })
            this.notify('Image Processed Successfully, Click the image for Download', 'green');
        },

        notify(message, color) {
            const h = this.$createElement;

            this.$notify({
                message: h('i', { style: 'color: ' + color }, message)
            });
        },
    }
}
</script>