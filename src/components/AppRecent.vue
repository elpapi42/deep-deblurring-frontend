<template>
    <div class='grid grid-rows-1 grid-flow-col gap-4 overflow-x-auto h-full'>
        <div 
            v-for='image in recents'
            :key='image.uuid'
            class='w-32'
        >
            <image-downloader :src='image.url' :name='image.name'/>
        </div>
    </div>
</template>

<script>
import ImageDownloader from './ImageDownloader'

export default {
    name: 'AppRecent',

    props: ['recents'],

    components: {
        ImageDownloader,
    },
}
</script>