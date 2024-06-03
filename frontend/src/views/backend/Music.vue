<template>
    <div class="flex flex-col mt-5 ml-2 mb-5">
        <div class="overflow-x-auto">
            <div class="inline-block min-w-full align-middle">
                <div class="overflow-hidden shadow">
                    <div id="default-modal" tabindex="-1" aria-hidden="true"
                        class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                        <div class="relative p-4 w-full max-w-2xl max-h-full">
                            <!-- Modal content -->
                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                <!-- Modal header -->
                                <div
                                    class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Music
                                    </h3>
                                    <button type="button" data-modal-hide="default-modal" @click="resetmodel(false)"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white">
                                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                            fill="none" viewBox="0 0 14 14">
                                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                                stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                        </svg>
                                        <span class="sr-only">Close modal</span>
                                    </button>
                                </div>
                                <!-- Modal body -->
                                <div class="p-4 md:p-5 space-y-4">
                                    <div>
                                        <label for="name"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
                                        <input @input="vreset('title')" v-model="music.title" type="text"
                                            name="firstname" id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.title && error.errors.title[0] != ''">{{
                                        error.errors.title[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="name"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Album name</label>
                                        <input @input="vreset('album_name')" v-model="music.album_name" type="text"
                                            name="firstname" id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.album_name && error.errors.album_name[0] != ''">{{
                                        error.errors.album_name[0]
                                    }}</span>
                                    </div>

                                    <div>
                                        <label for="genre"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select
                                            an option</label>
                                        <select @change="vreset('genre')" id="genre" v-model="music.genre"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                            <option selected>Choose a genre</option>
                                            <option value="rmb">Rmb</option>
                                            <option value="country">Country</option>
                                            <option value="classics">Classics</option>
                                            <option value="rock">Rock</option>
                                            <option value="jazz">Jazz</option>
                                        </select>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.genre && error.errors.genre[0] != ''">{{
                                        error.errors.genre[0]
                                    }}</span>
                                    </div>                                 
                                </div>
                                <!-- Modal footer -->
                                <div
                                    class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                                    <button v-if="musicId == 0" type="button" @click="submitMusic"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">ADD</button>
                                    <button v-else type="button" @click="updateMusic"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Update</button>
                                    <button @click="resetmodel(false)" type="button"
                                        class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="relative overflow-x-auto shadow-md sm:rounded-lg ">
                        <div
                            class="flex items-center justify-between flex-column flex-wrap md:flex-row space-y-4 md:space-y-0 pb-4 bg-white dark:bg-gray-900">

                            <div>
                                <div class="flex justify-between">

                                <button @click="add"
                                    class="mr-5 block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button">
                                    Add Album
                                </button>
                                <button @click.prevent="goback()"
                                class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button">
                                    Go back
                                </button>
                                </div>

                            </div>

                            <div class="relative">
                                <div
                                    class="absolute inset-y-0 rtl:inset-r-0 start-0 flex items-center ps-3 pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
                                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                            stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                    </svg>
                                </div>
                                <input type="text" id="table-search-music"
                                    @change="getmusic(musics.currentpage, $event.target.value)"
                                    class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="search music">
                            </div>
                        </div>
                        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400 ">
                            <thead
                                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        Music Title
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Album
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Genre
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="music in musics.data"
                                    class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <th scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ music.title }}
                                    </th>
                                    <td class="px-6 py-4">
                                        {{ music.album_name }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ music.genre }}
                                    </td>
                                    <td class="px-6 py-4">

                                        <a href="#"
                                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                                            @click="editmusic(music)">Edit</a>
                                        <a href="#"
                                            class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-3 ml-2 py-1 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                                            @click="deletemusic(music.id)">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <Paginate :currentpage="musics.currentpage" :perpage="musics.perpage" :total="musics.total"
                            :search="''" @loadDate="getmusic" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- </div> -->
</template>

<script setup>
import { ref, onMounted, reactive, computed } from "vue";
import Paginate from '../../components/common/pagination.vue'
import axios from '../../axios';
import Swal from 'sweetalert2'
import { useRoute } from 'vue-router';
import router from "@/router";
const route = useRoute();

const goback = () =>{
    router.push({ name: "artist" }).catch((err) => console.log(err));
}
const musics = ref([])
const error = ref({
    "message": "",
    "errors": {
        "title": [
                ""
            ],
            "album_name": [
                ""
            ],
            "genre": [
                ""
            ]

    }
})
const musicId = ref(0);
const vreset = (str) => {
    error.value.errors[str] = [''];
}
const editmusic = (data) => {
    reset();
    music.value.title = data.title;
    music.value.album_name = data.album_name;
    music.value.genre = data.genre;
    musicId.value = data.id;
    resetmodel(true)

}
const resetmodel = (flag) => {
    const $modalElement = document.querySelector('#default-modal');
    const modalOptions = {
        placement: 'bottom-right',
        backdrop: 'dynamic',
        backdropClasses: 'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
    }

    const modal = new Modal($modalElement, modalOptions);
    if (flag) {
        modal.show();
    } else {
        modal.hide();
    }
}

const music = ref({
    title: '',
    album_name: '',
    genre: '',
    artistid:0
})

const submitMusic = () => {
    Swal.fire({
        title: "Are you sure?",
        text: "You you want to store!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes"
    }).then((result) => {
        if (result.isConfirmed) {
            axios.setHeader()
            axios.post('api/music-create', music.value).then((response) => {
                if (response.status == 200) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Music Created successfully"
                    });
                    reset();
                    resetmodel(false)
                    getmusic(musics.value.currentpage, '')
                }
            }).catch((e) => {
                error.value = e.response.data
            })
        }
    });

}
const add = () => {
    musicId.value = 0;
reset()
resetmodel(true)
}
const updateMusic = () => {
    Swal.fire({
        title: "Are you sure?",
        text: "You you want to update!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes"
    }).then((result) => {
        if (result.isConfirmed) {
            axios.setHeader()
    axios.put('api/music-update/' + musicId.value, music.value).then((response) => {
        if (response.status == 200) {
            const Toast = Swal.mixin({
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
            });
            Toast.fire({
                icon: "success",
                title: "Music Updated successfully"
            });
            reset();
            resetmodel(false)
            getmusic(musics.value.currentpage, '')
        }
    }).catch((e) => {
        error.value = e.response.data;
    })
}
});
}
const deletemusic = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You want to delete!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            axios.setHeader()
            axios.delete('api/music-delete/' + id+"/"+music.value.artistid).then((response) => {
                if (response.status == 200) {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: "top-end",
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Music Deleted successfully"
                    });
                    getmusic(musics.value.currentpage, '')
                }
            }).catch((e) => {
                error.value = e.response.data;
            })
        }
    });

}
const getmusic = (pageno = 1, search = '') => {
    axios.setHeader()
    axios.get('api/get-music-list/'+music.value.artistid , {
        params: {
            page: pageno,
            search: search
        }
    }).then((response) => {
        musics.value = response.data;
    }).catch((error) => {
        console.log(error.response.data.message);
    })
}
const reset = () => {
    music.value.title = '';
    music.value.album_name = '';
    music.value.genre = '';
    error.value = {
        "message": "",
        "errors": {
            "title": [
                ""
            ],
            "album_name": [
                ""
            ],
            "genre": [
                ""
            ]
        }
    };
}

onMounted(() => {
   let artistid = route.params.id;
   music.value.artistid = artistid;
    getmusic(1, '')
})
</script>