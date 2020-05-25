<template>
    <div class='flex flex-col space-y-2 pb-2 items-center bg-gray-300 h-full'>
        <image-downloader :src='data.url' :name='data.name'/>
        <star-rating item-size='12' :show-rating='false'></star-rating>
    </div>
</template>

<script>
import {StarRating} from 'vue-rate-it';
import ImageDownloader from './ImageDownloader';

export default {
    name: 'RecentsCard',

    components:{
        StarRating,
        ImageDownloader,
    },

    props: { data: Object },
}
</script>