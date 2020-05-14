<template>
    <div class="flex flex-col items-center">
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
            }
        },

        methods: {
            handleImageUpload() {
                this.imageFile = this.$refs.inputImage.files[0];
            },

            submitImage() {
                let formData = new FormData();
                formData.append('image', this.imageFile);

                this.$http.post(
                    'http://localhost:8000/api/inference/',
                    formData,
                    { headers: { 'Content-Type': 'multipart/form-data' }},
                ).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                });
            },
        },
    }
</script>