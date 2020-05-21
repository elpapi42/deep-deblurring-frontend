<template>
    <div class='flex flex-row rounded items-center justify-center space-x-2'>
        <div class=''>
            <image-uploader @load='onLoad' @error='onError' @upload='onUpload'/>
        </div>

        <div class=''>
            <image-downloader :src='outputUrl' :name='imageName' :loading='loading'/>
        </div>
    </div>
</template>

<script>
import ImageUploader from './ImageUploader'
import ImageDownloader from './ImageDownloader'
//w-48 sm:w-52 md:w-56 lg:w-60 xl:w-64 h-48 sm:h-52 md:h-56 lg:h-60 xl:h-64
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