<template>
    <div class='flex flex-col h-full space-y-2 shadow-xl p-2'>
        <h1 class='text-lg font-medium'>Recent Uploads</h1>
        <div class='flex space-x-2 overflow-x-auto h-full'>
            <div 
                v-for='image in recents'
                :key='image.uuid'
                class='w-24 sm:w-32 flex-shrink-0'
            >
                <image-downloader :src='image.url' :name='image.name'/>
            </div>
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