<template>
    <div class='flex flex-col sm:flex-row sm:space-x-4 space-y-4 sm:space-y-0 max-w-screen-md w-full justify-center'>
        <div
            class='h-64 sm:h-full w-full rounded border-4 border-dashed p-1'
            :class='[{ "hover:border-opacity-75": !loading }, getBorderColor(inputStatus)]'
        >
            <image-uploader 
                :disabled='loading'
                @load='onLoad'
                @error='onError'
                @upload='onUpload'
                :class='{ "cursor-pointer": !loading }'
            />
        </div>
        <div
            class='h-64 sm:h-full w-full rounded border-4 border-dashed p-1'
            :class='[{ "hover:border-opacity-75": !loading }, getBorderColor(outputStatus)]'
        >
            <div class='flex h-full relative'> <!-- This double div is required for padding to work with absolute position -->
                <image-downloader
                    :src='outputUrl'
                    :name='imageName'
                    class='absolute'
                    :class='{ "cursor-pointer": !loading }'
                />
                <div v-if='loading' class='flex items-center justify-center w-full bg-gray-200 bg-opacity-50 z-10'>
                    <scaling-squares-spinner
                        :animation-duration='1250'
                        :size='65'
                        color='#38b2ac'
                    />
                </div>
            </div>
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
            inputStatus: 'normal',
            outputStatus: 'normal',
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
        onError(message) {
            this.outputUrl = '';
            this.imageName = '';
            this.loading = false;

            // Select proper color and info text depending on the error
            switch(message) {
                case 'invalid file type':
                    this.inputStatus = 'error';
                    this.outputStatus = 'normal';
                    break;
                case 'image too big':
                    this.inputStatus = 'error';
                    this.outputStatus = 'normal';
                    break;
                case 'server error':
                    this.inputStatus = 'normal';
                    this.outputStatus = 'error';
                    break;
                default:
                    this.inputStatus = 'normal';
                    this.outputStatus = 'normal';
                    break;
            }
        },

        onLoad(url) {
            this.outputUrl = url;
            this.inputStatus = 'ok';
            this.outputStatus = 'loading';
            this.loading = true;
        },

        onUpload(response) {
            this.outputUrl = response.output_image;
            this.imageName = response.image_name;
            this.outputStatus = 'ok';
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

        getBorderColor(status) {
            switch(status) {
                case 'normal': return 'border-gray-700';
                case 'error': return 'border-red-700';
                case 'ok': return 'border-green-700';
                case 'loading': return 'border-teal-500';
            }
        },
    }
}
</script>