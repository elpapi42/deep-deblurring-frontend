<template>
    <img 
        :src='url'
        @error='onBrokenLink'
        class='rounded object-cover h-full w-full'
        alt='image'
    />
</template>

<script>
    export default {
        name: 'AppImage',

        props: {
            src: { type: String, required: true },
            placeholder: { 
                type: String,
                default: 'https://res.cloudinary.com/deep-deblurring/image/upload/v1590626814/static/transparent_placeholder.png'
            },
        },

        data: function () {
            return {
                url: null,
            }
        },

        mounted () {
            this.url = this.src;
        },

        methods: {
            onBrokenLink() {
                this.url = this.placeholder;
            },
        },

        watch: {
            src: function () {
                this.url = this.src;
            },
        },
    }
</script>