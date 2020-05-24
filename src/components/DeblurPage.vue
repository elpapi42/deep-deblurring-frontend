<template>
<div class='flex flex-col space-y-4'>
    <!--Heading-->
    <header class='flex justify-center w-full mt-2'>
        <h1 class='text-2xl text-center p-2'>Deep\PNG</h1>
    </header>

    <!--Images Box-->
    <main class='flex justify-center h-full sm:h-64'>
        <app-processor></app-processor>
    </main>

    <!-- body -->
    <main class='flex justify-center'>
        <div class='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8 max-w-screen-lg'>
            <div class='md:col-span-2'>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <!--Recents-->
            <div class='sm:row-span-2 md:row-span-3'>
                <img class='w-full h-full object-cover rounded' src='https://res.cloudinary.com/deep-deblurring/image/upload/v1589559567/static/placeholder.png' alt='img'>
            </div>

            <div class=''>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.  Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <div class=''>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>
        </div>
    </main>

    <footer class='bg-gray-800 p-4'>
        <p class='text-justify text-white'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
        <h1 class='text-xl text-center text-white p-4'>DeepPNG All Rights Reserved</h1>
    </footer>
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