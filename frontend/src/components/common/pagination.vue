<template>
 <nav class="flex items-center flex-column flex-wrap md:flex-row justify-between pt-4"
                            aria-label="Table navigation">
                            <span
                                class="text-sm font-normal text-gray-500 dark:text-gray-400 mb-4 md:mb-0 block w-full md:inline md:w-auto">Showing
                                <span class="font-semibold text-gray-900 dark:text-white">{{ currentpage }}-{{ noofpage }}</span> of
                                <span class="font-semibold text-gray-900 dark:text-white">{{ total }}</span></span>
                            <ul class="inline-flex -space-x-px rtl:space-x-reverse text-sm h-8">
                                <li>
                                    <a @click="loadDate(currentpage == 1 ? 1 : currentpage - 1, search)"
                                        class="flex items-center justify-center px-3 h-8 ms-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-s-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Previous</a>
                                </li>
                                <li v-for="n in noofpage" v-show="currentpage <= n
                                        ? n <= currentpage + 4
                                        : n >= currentpage - 4
                                    ">
                                    <a @click="loadDate(n, search)"
                                        :class="currentpage == n ? 'flex items-center justify-center px-3 h-8 text-blue-600 border border-gray-300 bg-blue-50 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white' : 'flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white'">{{
                                    n }}</a>
                                </li>

                                <li>
                                    <a @click="loadDate(currentpage == noofpage ? noofpage : currentpage + 1,search)"
                                        class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-e-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Next</a>
                                </li>
                            </ul>
                        </nav>
</template>
<script setup>
import { defineEmits,computed } from 'vue';

const emit = defineEmits(['loadDate'])

const loadDate = (pageno,search) => {
    emit('loadDate', pageno,search)
}
const noofpage = computed(() => {
    let no = props.total/props.perpage;
    let round = no - props.perpage;
    console.log(no,round)
    if(Math.abs(round)> 0){
        no += 1;
    }
    return parseInt(no);
})

const props = defineProps({

    currentpage: {
        type: Number,
        default() {
            return 1;
        }
    },
    perpage: {
        type: Number,
        default() {
            return 1;
        }
    },
    total: {
        type: Number,
        default() {
            return 1;
        }
    },
    from: {
        type: Number,
        default() {
            return 1;
        }
    },
    search: {
        type: String,
        default() {
            return "";
        }
    }
})


</script>