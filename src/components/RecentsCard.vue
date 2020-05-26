<template>
    <div class='flex flex-col space-y-2 pb-2 items-center bg-gray-300 h-full'>
        <image-downloader :src='data.url' :name='data.name'/>
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