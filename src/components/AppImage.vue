<template>
    <div class='w-full h-full'>
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