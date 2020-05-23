<template>
    <label class='h-full'>
        <div v-if='!loading' class='h-full'>
            <app-image :src='src'/>
            <button class='hidden' @click='downloadImage'/>
        </div>
        <div v-else class="el-loading-parent--relative h-full w-full">
            <div class="el-loading-mask bg-gray-400" style="">
                <div class="flex el-loading-spinner justify-center">
                    <svg viewBox="25 25 50 50" class="circular">
                        <circle cx="50" cy="50" r="20" fill="none" class="path"></circle>
                    </svg>
                </div>
            </div>
        </div>
    </label>
</template>

<script>
import AppImage from './AppImage'

export default {
    name: 'ImageDownloader',
    components: { AppImage },

    props: { 
        src: String,
        name: String,
        loading: {
            type: Boolean,
            default: false
        },
    },

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
                fileLink.setAttribute('download', this.name);
                document.body.appendChild(fileLink);

                fileLink.click();
            }).catch((error) => {
                console.log(error);
            });
        },
    }
}
</script>