<template>
    <div class='flex flex-col sm:flex-row sm:space-x-4 space-y-4 sm:space-y-0 max-w-screen-md w-full justify-center'>
        <div class='h-64 sm:h-full w-full shadow-lg'>
            <image-uploader @load='onLoad' @error='onError' @upload='onUpload'/>
        </div>
        <div class='h-64 sm:h-full w-full shadow-lg'>
            <image-downloader :src='outputUrl' :name='imageName' :loading='loading'/>
        </div>
    </div>
</template>

<script>
import ImageUploader from './ImageUploader'
import ImageDownloader from './ImageDownloader'
import ScalingSquaresSpinner from 'epic-spinners/src/components/lib/ScalingSquaresSpinner'

export default {
    name: 'AppProcessor',
    components: { ImageUploader, ImageDownloader, ScalingSquaresSpinner },

    data: function () {
        return {
            outputUrl: '',
            imageName: '',
            loading: false,
            recents: [],
        }
    },

    mounted() {
        // Reads the recents images saved in localStorage
        if(localStorage.getItem('recents')) {
           try {
                this.recents = JSON.parse(localStorage.getItem('recents'));
           } catch { 
                /*
                If the json array is corrupted, just remove it
                It will be rewrited later
                */
                localStorage.removeItem('recents');
           }
        }
    },

    methods: {
        onError() {
            this.outputUrl = '';
            this.imageName = '';
            this.loading = false;
        },

        onLoad() {
            this.loading = true;
        },

        onUpload(response) {
            this.outputUrl = response.output_image;
            this.imageName = response.image_name;
            this.loading = false;

            // Inserts the info that will be used later
            this.recents.splice(0, 0, { 
                url: this.outputUrl,
                name: this.imageName,
                uuid: response.resource_id,
                score: null
            });

            // Writes to localStorage
            localStorage.setItem('recents', JSON.stringify(this.recents));

            // Notifies that a new entry was added to localStorage
            window.dispatchEvent(new CustomEvent('on-upload-event'));
        },
    }
}
</script>