<template>
    <div class="flex flex-col items-center">
        <img v-if="input_url" :src="input_url"/>
        <img v-if="output_url" :src="output_url"/>
        <input type="file" id="inputImage" ref="inputImage" v-on:change="handleImageUpload()"/>
        <button v-on:click="submitImage()">Submit</button>
    </div>
</template>

<script>
    export default {
        name: 'DeblurPage',

        data: function () {
            return {
                imageFile: '',
                input_url: null,
                output_url: null,
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
        },
    }
</script>