<template>
<div class='m-1 sm:mx-2 md:mx-4'>
    <div class='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 w-full h-full'>
        <!--Heading-->
        <div class='sm:col-span-2 md:col-start-2 md:col-end-4 bg-gray-500 rounded p-4'>
            <h1 class='text-3xl text-center'>Deep\PNG</h1>
        </div>

        <div class='hidden md:block col-start-1 bg-gray-800 rounded p-4'>
            <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
        </div>

        <!--Images Box-->
        <div class='sm:col-span-2 md:col-start-2 md:col-end-4 bg-gray-800 rounded p-4'>
            <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
        </div>

        <div class='hidden md:block bg-gray-800 rounded p-4'>
            <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
        </div>

        <div class='bg-gray-500 rounded p-4'>
            <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
        </div>

        <div class='md:col-span-1 bg-gray-500 rounded p-4'>
            <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            <br>
            <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
        </div>

        <!--Recents-->
        <div class='sm:col-span-2 md:row-span-2 bg-gray-800 rounded p-4'>
            <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
        </div>

        <div class='sm:col-span-2 bg-gray-500 rounded p-4'>
            <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            <br>
            <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
        </div>

        <!--Footing-->
        <div class='sm:col-span-2 md:col-span-4 bg-gray-500 rounded p-4'>
            <h1 class='text-xl text-center'>DeepPNG All Rights Reserved</h1>
        </div>
    </div>
</div>
</template>

<script>
//import AppProcessor from './AppProcessor';
//import AppRecent from './AppRecent';

export default {
    name: 'DeblurPage',

    components: {
        //AppProcessor,
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