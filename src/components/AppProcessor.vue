<template>
    <div class='flex flex-row bg-gray-500 border-8 border-gray-500 rounded items-center justify-center'>
        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <image-uploader @load='onLoad' @error='onError' @upload='onUpload'/>
        </div>

        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <image-downloader :src='outputUrl'/>
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
        }
    },

    computed: {
    },

    methods: {
        onError(error) {
            this.outputUrl = '';
            this.imageName = '';
            this.notify(error, 'red');
        },

        onLoad(name) {
            this.notify('Uploading Image to the Server', 'green');
            this.imageName = name
        },

        onUpload(response) {
            this.notify('Image Processed Successfully, Click the image for Download', 'green');
            this.outputUrl = response.output_image;
            this.$emit('upload', response)
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