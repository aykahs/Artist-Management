<template>
    <div class="flex flex-col">
        <div class="overflow-x-auto">
            <div class="inline-block min-w-full align-middle">
                <div class="overflow-hidden shadow">
                    <div class="bg-white shadow-md rounded-lg p-6">
                        <h2 class="text-xl font-semibold mb-4">Dashboard</h2>
                        <div class="flex justify-between">
                            <div class="bg-gray-100 rounded-lg p-4 mr-4">
                                <p class="text-gray-700">Users</p>
                                <p class="text-3xl font-bold">{{  data.ucount ?? 0}}</p>
                            </div>
                            <div class="bg-gray-100 rounded-lg p-4 mr-4">
                                <p class="text-gray-700">Artist</p>
                                <p class="text-3xl font-bold">{{  data.acount ??0 }}</p>
                            </div>
                            <div class="bg-gray-100 rounded-lg p-4">
                                <p class="text-gray-700">Music</p>
                                <p class="text-3xl font-bold">{{  data.mcount ?? 0}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
    import { ref, onMounted, reactive, computed } from "vue";
    import axios from "../../axios";
    const data = ref({
        ucount: 0,
        acount:0,
        mcount:0
    });
    const getdashboard= () => {
        axios.setHeader();
        axios
            .get("api/dashboard")
            .then((response) => {
                if(response.status == 200){
                    data.value = response.data[0];
                }
            })
            .catch((error) => {
                console.log(error.response.data.message);
            });
    };
    
    onMounted(() => {
        getdashboard();
    });
</script>