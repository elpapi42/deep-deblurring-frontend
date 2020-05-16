<template>
    <div class="flex flex-row w-screen h-screen">
        <div class='flex w-full h-full bg-gray-200 items-center justify-center'>
            <app-uploader/>
        </div>
        <!--
        <img v-if="input_url" :src="input_url"/>
        <img v-if="output_url" :src="output_url"/>
        <input type="file" id="inputImage" ref="inputImage" v-on:change="handleImageUpload()"/>
        <button v-on:click="submitImage()">Submit</button>
        <button v-on:click="changeLink">change link</button>
        -->
    </div>
</template>

<script>
    import AppUploader from './AppUploader';
    

    export default {
        name: 'DeblurPage',

        components: {
            AppUploader,
        },

        data: function () {
            return {
                imageFile: '',
                input_url: null,
                output_url: null,
                url: 'https://loremflickr.com/640/360',
            }
        },

        methods: {
            handleImageUpload() {
                this.imageFile = this.$refs.inputImage.files[0];
                this.input_url = URL.createObjectURL(this.imageFile)
            },

            submitImage() {
                let self = this;
                let formData = new FormData();
                formData.append('image', this.imageFile);

                this.$http.post(
                    'http://localhost:8000/api/inference/',
                    formData,
                    { headers: { 'Content-Type': 'multipart/form-data' }},
                ).then(function(response) {
                    self.output_url = response.data.output_image;
                }).catch(function(error) {
                    console.log(error);
                });
            },

            isFileImage(file) {
                const acceptedImageTypes = ['image/gif', 'image/jpeg', 'image/png'];
                return file && acceptedImageTypes.includes(file['type'])
            },

            changeLink() {
                if(this.url == 'https://loremflickr.com/640/360') {
                    this.url = ''
                } else {
                    this.url = 'https://loremflickr.com/640/360'
                }
            }
        },
    }
</script>