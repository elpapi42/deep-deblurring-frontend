<template>
    <div class='flex flex-col-reverse w-full h-full items-center justify-end'>
        <div 
            v-for='image in recents'
            :key='image.uuid'
            class='w-full p-2'
        >
            <image-downloader :src='image.url' :name='image.name'/>
        </div>
    </div>
</template>

<script>
import ImageDownloader from './ImageDownloader'
//w-12 sm:w-14 md:w-16 lg:w-32 xl:w-34 h-12 sm:h-14 md:h-16 lg:h-32 xl:h-34
export default {
    name: 'AppRecent',

    props: ['recents'],

    components: {
        ImageDownloader,
    },
}
</script>