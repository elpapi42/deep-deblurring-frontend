<template>
    <div class='w-24 sm:w-28 md:w-28 lg:w-32 xl:w-48 h-24 sm:h-28 md:h-28 lg:h-32 xl:h-48 border-gray-500 rounded'>
        <img 
            :src='url'
            class='w-full h-full rounded object-cover'
            @error='onBrokenLink'
        />
    </div>
</template>

<script>
    export default {
        name: 'AppImage',

        props: {
            src: { type: String, required: true },
            placeholder: { 
                type: String,
                default: 'https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png'
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