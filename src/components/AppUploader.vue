<template>
    <div class='flex flex-row w-1/3 bg-gray-500 border-8 border-gray-500 rounded items-center justify-center'>
        <div class='flex flex-col w-full items-center justify-center p-2 space-y-4'>
            <app-image src='https://loremflickr.com/256/1024'/>
            <label class='w-2/3 bg-gray-600 rounded p-2'>
                <div class='w-full text-center'>
                    <span v-if='false'>Name</span>
                    <span v-else>Select</span>
                </div>
                <input
                    type="file"
                    id='inputImage'
                    ref='inputImage'
                    class='hidden'
                />
            </label>
        </div>
        <div class='flex flex-col w-full items-center justify-center p-2 space-y-4'>
            <app-image src='https://loremflickr.com/256/1024'/>
            <label class='w-2/3 bg-gray-600 rounded p-2'>
                <div class='w-full text-center'>
                    <span>Download</span>
                </div>
            </label>
        </div>
    </div>
</template>

<script>
    import AppImage from './AppImage'
    //@change="handleImageUpload"
    export default {
        name: 'AppUploader',
        components: { AppImage },

        data: function () {
            return {
            }
        },
    }
</script>