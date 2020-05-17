<template>
    <div class='flex flex-row bg-gray-500 border-8 border-gray-500 rounded items-center justify-center'>
        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <app-image-picker @load='onImageSelected' @error='onImageCleared'/>
        </div>

        <el-button 
            type="primary"
            icon="el-icon-upload"
            circle
            @click='uploadImage'
        ></el-button>

        <div class='w-14 sm:w-22 md:w-48 lg:w-52 xl:w-64 h-14 sm:h-22 md:h-48 lg:h-52 xl:h-64'>
            <app-image-downloader :url='outputUrl'/>
        </div>
    </div>
</template>

<script>
import AppImagePicker from './AppImagePicker'
import AppImageDownloader from './AppImageDownloader'

export default {
    name: 'AppUploader',
    components: { AppImagePicker, AppImageDownloader },

    data: function () {
        return {
            inputImage: null,
            outputUrl: '',
        }
    },

    methods: {
        onImageSelected(image) {
            this.inputImage = image;
        },

        onImageCleared() {
            this.outputUrl = '';
            this.inputImage = null;
        },

        uploadImage() {
            if(!this.inputImage) { return; }

            let formData = new FormData();
            formData.append('image', this.inputImage);

            this.$axios.post(
                process.env.VUE_APP_API_URL + '/inference/',
                formData,
                { headers: { 'Content-Type': 'multipart/form-data' }},
            ).then((response) => {
                this.outputUrl = response.data.output_image;
                this.$emit('upload', response.data)
            }).catch((error) => {
                this.outputUrl = '';
                console.log(error);
            });
        },
    }
}
</script>