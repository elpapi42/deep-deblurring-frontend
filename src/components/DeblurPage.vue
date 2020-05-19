<template>
    <div class="flex flex-row w-screen h-screen">
        <div class='w-40 h-full bg-gray-300 items-center justify-center'>
            <app-recent :recents='recentUploads'/>
        </div>
        <div class='flex w-full h-full bg-gray-200 items-center justify-center'>
            <app-processor @upload='onUpload'/>
        </div>
    </div>
</template>

<script>
    import AppProcessor from './AppProcessor';
    import AppRecent from './AppRecent';

    export default {
        name: 'DeblurPage',

        components: {
            AppProcessor,
            AppRecent,
        },

        data: function () {
            return {
                recentUploads: [],
            }
        },

        methods: {
            onUpload(data) {
                this.recentUploads.push(data);
            },
        },
    }
</script>