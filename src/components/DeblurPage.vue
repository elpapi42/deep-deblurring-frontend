<template>
<div class='flex flex-col bg-bottom bg-cover'>
    <!--Heading-->
    <header class='shadow-lg bg-white justify-center'>
        <h1 class='text-2xl text-center p-2'>Deep\PNG</h1>
    </header>

    <!--Images Box-->
    <main class='flex justify-center bg-gray-200 h-full sm:h-64 p-2'>
        <app-processor></app-processor>
    </main>

    <!-- body -->
    <main class='flex justify-center bg-gray-200 p-2'>
        <div class='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 max-w-screen-lg'>
            <div class='sm:col-span-2 md:col-span-1'>
                <h1 class='text-center font-medium'>Quickstart</h1>
                <p class='text-center'>
                    For start with the app, just drag and drop an image to the first dashed square,
                    the magic will happen automatically, after a few seconds, your image will be ready,
                    click the second dashed square for download it! On the recents tab,
                    you can see an historic of operations with us, download your past images from there,
                    and rate the results with your percieved quality of the restored image,
                    that will help us to improve. Thanks!
                </p>
            </div>

            <!--Recents-->
            <div class='sm:col-span-2 bg-white rounded shadow-lg'>
                <app-recent></app-recent>
            </div>

            <div class='md:row-span-2'>
                <h1 class='text-center font-medium'>What is DeepPNG?</h1>
                <p class='text-center'>
                    An open-source personal-project application that offers an image deblurring/restoration solution 
                    powered by the latest Deep Learning advances in Image Restoration Research. 
                    The service expose an powerful Deep Learning Model specialized in Image Quality Restoration called DeblurGAN-V2
                    ( Orest Kupyn and Team 
                    <a class='text-teal-700' href="https://arxiv.org/abs/1908.03826">
                        "DeblurGAN-v2: Deblurring (Orders-of-Magnitude) Faster and Better"
                    </a>
                    ).
                </p>
            </div>

            <div class='sm:col-span-1 md:col-span-2'>
                <h1 class='text-center font-medium'>About Usage Restrictions</h1>
                <p class='text-center'>
                    Due to budget limitations, this application has stric usage limitations for prevent service overflow.
                    Please use it just for the minimum an avoid bulk operations in short spans of time.
                    We are using Heroku free tier for keep this service live, but there are stric usage limits per month,
                    help us to keep this application live using it just the neccessary time.
                </p>
            </div>

            <div class='grid sm:col-span-2 bg-white rounded shadow-lg'>
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