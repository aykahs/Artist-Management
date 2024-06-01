<template>
    <Navbar></Navbar>
    <section class="flex pt-16 overflow-hidden  dark:bg-gray-900">
        <Sidebar></Sidebar>
        <div id="main-content" class="relative w-full h-full overflow-y-auto  lg:ml-64">
            <main>
                <!-- <Breadcrumb></Breadcrumb> -->
                <router-view></router-view>
            </main>
        </div>
    </section>
</template>

<script setup>
import Sidebar from './Sidebar.vue';
import Navbar from './Navbar.vue';
import Breadcrumb from './Breadcrumb.vue';

</script>