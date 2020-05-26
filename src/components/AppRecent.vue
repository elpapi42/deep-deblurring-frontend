<template>
    <div class='flex flex-col h-full space-y-2 shadow-lg bg-white px-2 pt-2'>
        <h1 class='text-lg font-medium'>Recent Uploads</h1>
        <div class='flex space-x-2 overflow-x-auto h-full pb-2'>
            <div 
                v-for='image in recents'
                :key='image.uuid'
                class='w-24 sm:w-32 flex-shrink-0'
            >
                <recents-card :data='image'/>
            </div>
        </div>
    </div>
</template>

<script>
import RecentsCard from './RecentsCard'

export default {
    name: 'AppRecent',

    props: ['recents'],

    components: {
        RecentsCard,
    },
}
</script>