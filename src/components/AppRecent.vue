<template>
    <div class='flex flex-col h-full space-y-2 rounded border-4 border-dashed border-gray-700 px-2 py-2'>
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

    components: { RecentsCard },

    data: function() {
        return {
            recents: [],
        }
    },

    mounted() {
        this.readRecents();
        window.addEventListener('on-upload-event', this.readRecents);
    },

    methods: {
        readRecents() {
            if(localStorage.getItem('recents')) {
                try {
                    this.recents = JSON.parse(localStorage.getItem('recents'));
                } catch { 
                    /*
                    If the json array is corrupted, just remove it
                    It will be rewrited later
                    */
                    localStorage.removeItem('recents');
                }
            }
        }
    },
}
</script>