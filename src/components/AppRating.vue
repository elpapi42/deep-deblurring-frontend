<template>
    <star-rating @rating-selected='onRate' :item-size='size' :show-rating='false'/>
</template>

<script>
import {StarRating} from 'vue-rate-it';

export default {
    name: 'AppRating',
    components: { StarRating },

    props: {
        size: {
            type: Number,
            default: 12,
        },

        uid: String,
    },

    methods: {
        onRate(score) {
            this.$axios.put(
                process.env.VUE_APP_API_URL + '/score/',
                {
                    resource_id: this.uid,
                    score: score
                }
            ).catch((error) => {
                console.log(error);
            });
        },
    }
}
</script>