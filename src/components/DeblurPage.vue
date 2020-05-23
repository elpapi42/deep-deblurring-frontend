<template>
<div class='flex flex-col space-y-4 my-1 mx-4'>
    <!--Heading-->
    <div class='self-center w-full'>
        <h1 class='text-2xl text-center'>Deep\PNG</h1>
    </div>

    <!--Images Box-->
    <div class='flex justify-center h-full sm:h-64'>
        <app-processor></app-processor>
    </div>

    <div class='flex justify-center'>
        <div class='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 max-w-screen-lg'>
            <div class='col-start-1 bg-gray-500 rounded p-4'>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <div class='md:col-span-1 bg-gray-500 rounded p-4'>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <!--Recents-->
            <div class='sm:col-span-2 md:row-span-2 bg-gray-800 rounded p-4'>
                <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
            </div>

            <div class='sm:col-span-2 bg-gray-500 rounded p-4'>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <!--Footing-->
            <div class='sm:col-span-2 md:col-span-4 bg-gray-500 rounded p-4'>
                <h1 class='text-xl text-center'>DeepPNG All Rights Reserved</h1>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import AppProcessor from './AppProcessor';
//import AppRecent from './AppRecent';

export default {
    name: 'DeblurPage',

    components: {
        AppProcessor,
        //AppRecent,
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