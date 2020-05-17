<template>
    <div class='flex flex-row bg-gray-500 border-8 border-gray-500 rounded items-center justify-center'>
        <div class='flex flex-col items-center justify-center p-2 space-y-4'>
            <app-image :src='inputUrl'/>
            <div class='flex w-full justify-around'>
                <label class='bg-gray-600 rounded p-2'>
                    <div class='text-center'>
                        <span v-if='inputImage'>{{ cutName(inputImage.name, 16) }}</span>
                        <span v-else>Select</span>
                    </div>
                    <input
                        type="file"
                        id='inputImage'
                        ref='inputImage'
                        @change="handleImageUpload"
                        class='hidden'
                    />
                </label>
                <button 
                    class='bg-gray-600 rounded text-center p-2'
                    @click='uploadImage()'
                >Upload</button>
            </div>
        </div>
        <div class='flex flex-col items-center justify-center p-2 space-y-4'>
            <app-image :src='outputUrl'/>
            <button 
                class='bg-gray-600 rounded text-center p-2'
                @click='downloadImage()'
            >Download</button>
        </div>
    </div>
</template>

<script>
import AppImage from './AppImage'

export default {
    name: 'AppUploader',
    components: { AppImage },

    data: function () {
        return {
            inputImage: null,
            inputUrl: '',
            outputUrl: '',
        }
    },

    methods: {
        handleImageUpload() {
            this.inputImage = this.$refs.inputImage.files[0];

            if(!this.inputImage) {
                this.inputUrl = '';
                this.inputImage = null;
                return;
            }

            if(this.isFileImage(this.inputImage)) {
                this.inputUrl = URL.createObjectURL(this.inputImage);
                return;
            }

            this.inputUrl = '';
            this.inputImage = null;
            alert('Invalid File');
            return;
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
            }).catch((error) => {
                this.outputUrl = '';
                console.log(error);
            });
        },

        downloadImage() {
            if(this.outputUrl == '') { return; }

            this.$axios.get(
                this.outputUrl,
                { responseType: 'blob' }
            ).then((response) => {
                var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                var fileLink = document.createElement('a');

                fileLink.href = fileURL;
                fileLink.setAttribute('download', this.inputImage.name);
                document.body.appendChild(fileLink);

                fileLink.click();
            }).catch((error) => {
                console.log(error);
            });
        },

        isFileImage(file) {
            const acceptedImageTypes = ['image/jpeg', 'image/png'];
            return file && acceptedImageTypes.includes(file['type'])
        },

        cutName(name, length) {
            return (name.length > length) ?
                name.substring(0, length - 3) + '...' :
                name;
        },
    }
}
</script>