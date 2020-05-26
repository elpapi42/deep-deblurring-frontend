<template>
    <star-rating @rating-selected='onRate' :rating='rating' :item-size='size' :show-rating='false'/>
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
        rating: Number,
        uid: String,
    },

    methods: {
        onRate(score) {
            // Send score to the server
            this.$axios.put(
                process.env.VUE_APP_API_URL + '/score/',
                {
                    resource_id: this.uid,
                    score: score
                }
            ).catch((error) => {
                console.log(error);
            });

            // Read from local storage
            let recents = JSON.parse(localStorage.getItem('recents'));

            //Looks for the item owning this rating components
            let selfItem = recents.filter(item => item.uuid == this.uid)[0];

            // Update score and rewrites to localStorage
            selfItem.score = score;
            localStorage.setItem('recents', JSON.stringify(recents));
        },
    }
}
</script>