<template>
  <div
    class="p-4 bg-white block sm:flex items-center justify-between border-b border-gray-200 lg:mt-1.5 dark:bg-gray-800 dark:border-gray-700">
    <div class="w-full">
      <div class="px-4">
        <nav class="flex" aria-label="Breadcrumb">
          <ol class="inline-flex items-center space-x-1 text-sm font-medium md:space-x-2">
            <template v-for="bread,index in breadcrumbs" :key="index">
              <li class="inline-flex items-center">
                <router-link :to="bread.pathname">
                <a
                  class="inline-flex items-center text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-white">
                  {{  bread.name }}
                </a>
                </router-link>
              </li>
              <li v-if="index != breadcrumbs.length -1">
                <div class="flex items-center">
                  <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                </div>
              </li>
            </template>
        </ol>
      </nav>
    </div>
  </div>
</div></template>
<script setup>
import {  computed } from "vue";
const breadcrumbs =[
    {
      name:"Home",
      pathname:{ name: 'dashboard'}
    }];
</script>
