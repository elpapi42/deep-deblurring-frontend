<template>
<div class='flex flex-col space-y-4 bg-gray-100'>
    <!--Heading-->
    <header class='shadow-md bg-white justify-center'>
        <h1 class='text-2xl text-center p-2'>Deep\PNG</h1>
    </header>

    <!--Images Box-->
    <main class='flex justify-center h-full sm:h-64 m-2'>
        <app-processor></app-processor>
    </main>

    <!-- body -->
    <main class='flex justify-center m-2'>
        <div class='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 max-w-screen-lg'>
            <div class='sm:col-span-2 md:col-span-1'>
                <p class='text-center'>Drop or pick your images in the top-left side, download the results just next to this. If you need to access a previous uploaded image, check the recents tab, if you wish, rate the results with some stars, that will help us improve DeepPNG. Thanks!</p>
            </div>

            <!--Recents-->
            <div class='sm:col-span-2'>
                <app-recent></app-recent>
            </div>

            <div class='md:row-span-2'>
                <p class='text-center'>Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing.Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing. Testing text for test the tested right side of the design mockup testing</p>
            </div>

            <div class='sm:col-span-1 md:col-span-2'>
                <p class='text-center'>This application is a personal project created by Whitman Bohorquez, Machine Learning Engineer, using the latest advances on the Deep Learning field, briging to life this an easy to use solution for improve the quality of blurred images without effort. You can check the details here: (repo link here)</p>
            </div>

            <div class='sm:col-span-2'>
                <app-stack></app-stack>
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
import AppRecent from './AppRecent';
import AppStack from './AppStack';

export default {
    name: 'DeblurPage',

    components: {
        AppProcessor,
        AppRecent,
        AppStack,
    },
}
</script>