<template>
    <div class="flex flex-row w-screen h-screen">
        <div class='flex w-full h-full bg-gray-200 items-center justify-center'>
            <app-uploader/>
        </div>
    </div>
</template>

<script>
    import AppUploader from './AppUploader';
    

    export default {
        name: 'DeblurPage',

        components: {
            AppUploader,
        },

        data: function () {
            return {
            }
        },

        methods: {
        },
    }
</script>