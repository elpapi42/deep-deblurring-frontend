<template>
    <div class='flex flex-col-reverse w-full h-full bg-gray-100 items-center justify-end'>
        <app-image v-for='item in recents.slice(-5, -1)' :key='item.resource_id' :src='item.output_image'/>
    </div>
</template>

<script>
import AppImage from './AppImage'

export default {
    name: 'AppRecent',

    props: ['recents'],

    components: {
        AppImage,
    }

}
</script>