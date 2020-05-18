<template>
    <label>
        <app-image :src='src'/>
        <button class='hidden' @click='downloadImage'/>
    </label>
</template>

<script>
import AppImage from './AppImage'

export default {
    name: 'AppImageDownloader',
    components: { AppImage },

    props: { src: String },

    methods: {
        downloadImage() {
            if(this.src == '') { return; }

            this.$axios.get(
                this.src,
                { responseType: 'blob' }
            ).then((response) => {
                var fileURL = window.URL.createObjectURL(new Blob([response.data]));
                var fileLink = document.createElement('a');

                fileLink.href = fileURL;
                fileLink.setAttribute('download', 'deblurred.jpg');
                document.body.appendChild(fileLink);

                fileLink.click();
            }).catch((error) => {
                console.log(error);
            });
        },
    }
}
</script>