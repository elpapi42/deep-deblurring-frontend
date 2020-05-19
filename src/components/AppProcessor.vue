<template>
    <div class='flex flex-row bg-gray-500 border-8 border-gray-500 rounded items-center justify-center space-x-2'>
        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <image-uploader @load='onLoad' @error='onError' @upload='onUpload'/>
        </div>

        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <image-downloader :src='outputUrl' :name='imageName' :loading='loading'/>
        </div>
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
            this.$emit('upload', { url: this.outputUrl, name: this.imageName })
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