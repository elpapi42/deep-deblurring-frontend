<template>
    <label class='h-full w-full'>
        <app-image :src='src'/>
        <button class='hidden' @click='downloadImage'/>
    </label>
</template>

<script>
import AppImage from './AppImage'
import Compressor from 'compressorjs'

export default {
    name: 'ImageDownloader',
    components: { AppImage },

    props: { 
        src: String,
        name: String,
        height: Number,
        width: Number,
    },

    methods: {
        downloadImage() {
            if(this.src == '') { return; }

            this.$axios.get(
                this.src,
                { responseType: 'blob' }
            ).then((response) => {
                // Resize the imag to the original size
                new Compressor(response.data, {
                    width: this.width,
                    height: this.height,
                    success: (resultImage) => {
                        var fileURL = window.URL.createObjectURL(resultImage);
                        var fileLink = document.createElement('a');

                        fileLink.href = fileURL;
                        fileLink.setAttribute('download', this.name);
                        document.body.appendChild(fileLink);

                        fileLink.click();
                    },
                    error: (err) => { console.log(err) },
                });
            }).catch((error) => {
                console.log(error);
            });
        },
    }
}
</script>