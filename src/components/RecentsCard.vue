<template>
    <div class='flex flex-col space-y-2 pb-2 items-center rounded border-2 border-gray-700 h-full'>
        <image-downloader 
            :src='data.url' 
            :name='data.name' 
            class='hover:opacity-75 cursor-pointer'
        />
        <app-rating :rating='data.score' :uid='data.uuid' :size='12'/>
    </div>
</template>

<script>
import AppRating from './AppRating'
import ImageDownloader from './ImageDownloader';

export default {
    name: 'RecentsCard',

    components:{
        AppRating,
        ImageDownloader,
    },

    props: { data: Object },
}
</script>