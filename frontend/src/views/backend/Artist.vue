<template>
    <div class="flex flex-col mt-5 ml-2 mb-5">
        <div class="overflow-x-auto">
            <div class="inline-block min-w-full align-middle">
                <div class="overflow-hidden shadow">
                    <div id="default-modal" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
                        <div class="relative p-4 w-full max-w-2xl max-h-full">
                            <!-- Modal content -->
                            <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                                <!-- Modal header -->
                                <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                                        Artist
                                    </h3>
                                    <button
                                        type="button"
                                        data-modal-hide="default-modal"
                                        @click="resetmodel(false)"
                                        class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white"
                                    >
                                        <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6" />
                                        </svg>
                                        <span class="sr-only">Close modal</span>
                                    </button>
                                </div>
                                <!-- Modal body -->
                                <div class="p-4 md:p-5 space-y-4">
                                    <div>
                                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Artist Name</label>
                                        <input
                                            @input="vreset('name')"
                                            v-model="artist.name"
                                            type="text"
                                            name="firstname"
                                            id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder=""
                                            required
                                        />
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.name && error.errors.name[0] != ''">{{ error.errors.name[0] }}</span>
                                    </div>
                                    <div>
                                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First Release Year</label>
                                        <!-- <input
                                            @input="vreset('first_release_year')"
                                            v-model="artist.first_release_year"
                                            type="text"
                                            name="firstname"
                                            id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder=""
                                            required
                                        /> -->
                                        <VueDatePicker  @input="vreset('first_release_year')" v-model="artist.first_release_year" year-picker></VueDatePicker>

                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.first_release_year && error.errors.first_release_year[0] != ''">{{ error.errors.first_release_year[0] }}</span>
                                    </div>
                                    <div>
                                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">No of Album</label>
                                        <input
                                            @input="vreset('no_of_album_release')"
                                            v-model="artist.no_of_album_release"
                                            type="number"
                                            name="no_of_album_release"
                                            id="no_of_album_release"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder=""
                                            required
                                        />
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.no_of_album_release && error.errors.no_of_album_release[0] != ''">{{ error.errors.no_of_album_release[0] }}</span>
                                    </div>
                                    <div>
                                        <label for="dob" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Date of birth</label>
                                        <VueDatePicker @update:model-value="vreset('dob')" v-model="artist.dob" :format="format"></VueDatePicker>

                                        <!-- <input
                                            @input="vreset('dob')"
                                            v-model="artist.dob"
                                            type="date"
                                            name="dob"
                                            id="dob"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder=""
                                            required
                                        /> -->
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.dob && error.errors.dob[0] != ''">{{ error.errors.dob[0] }}</span>
                                    </div>
                                    <div>
                                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                        <input
                                            @input="vreset('address')"
                                            v-model="artist.address"
                                            type="text"
                                            name="address"
                                            id="address"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder=""
                                            required
                                        />
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.address && error.errors.address[0] != ''">{{ error.errors.address[0] }}</span>
                                    </div>
                                    <div>
                                        <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select an option</label>
                                        <select
                                            @change="vreset('gender')"
                                            id="gender"
                                            v-model="artist.gender"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                        >
                                            <option selected>Choose a Gender</option>
                                            <option value="m">Male</option>
                                            <option value="f">Female</option>
                                            <option value="o">Other</option>
                                        </select>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.errors.gender && error.errors.gender[0] != ''">{{ error.errors.gender[0] }}</span>
                                    </div>

                                </div>
                                <!-- Modal footer -->
                                <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                                    <button
                                        v-if="artistId == 0"
                                        type="button"
                                        @click="submitArtist"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    >
                                        ADD
                                    </button>
                                    <button
                                        v-else
                                        type="button"
                                        @click="updateArtist"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    >
                                        Update
                                    </button>
                                    <button
                                        @click="resetmodel(false)"
                                        type="button"
                                        class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                                    >
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                        <div class="flex items-center justify-between flex-column flex-wrap md:flex-row space-y-4 md:space-y-0 pb-4 bg-white dark:bg-gray-900">
                            <div>
                                <div class="flex justify-between">
                                    <button
                                        @click="add"
                                        class="mr-5 block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                        type="button"
                                    >
                                        Add Artist
                                    </button>
                                    <button
                                        @click="exportArtist"
                                        class="mr-5 block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                        type="button"
                                    >
                                        Export excel
                                    </button>
                                    <input aria-describedby="user_avatar_help" id="user_avatar" type="file" @change="handleFileUpload" />

                                </div>
                            </div>

                            <div class="relative">
                                <div class="absolute inset-y-0 rtl:inset-r-0 start-0 flex items-center ps-3 pointer-events-none">
                                    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                    </svg>
                                </div>
                                <input
                                    type="text"
                                    id="table-search-artist"
                                    @change="getartist(artists.currentpage, $event.target.value)"
                                    class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="search artist"
                                />
                            </div>
                        </div>
                        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        First Release Year
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        No of Album
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Address
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="artist in artists.data" class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ artist.name }}
                                    </th>
                                    <td class="px-6 py-4">
                                        {{ artist.first_release_year }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ artist.no_of_album_release }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ artist.address }}
                                    </td>
                                    <td class="px-6 py-4">
                                        <a
                                            href="#"
                                            class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-3 ml-2 py-1 me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-900"
                                            @click.prevent="gotoMusic(artist.id)"
                                        >
                                            View Music
                                        </a>
                                        <a
                                            href="#"
                                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                                            @click="editartist(artist)"
                                        >
                                            Edit
                                        </a>
                                        <a
                                            href="#"
                                            class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-3 ml-2 py-1 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                                            @click="deleteartist(artist.id)"
                                        >
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <Paginate :currentpage="artists.currentpage" :perpage="artists.perpage" :total="artists.total" :search="''" @loadDate="getartist" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- </div> -->
</template>

<script setup>
    import { ref, onMounted, reactive, computed } from "vue";
    import Paginate from "../../components/common/pagination.vue";
    import axios from "../../axios";
    import Swal from "sweetalert2";
    import { useRouter } from "vue-router";
    import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
const search = ref('');

const date = ref();
    const router = useRouter();
    const format = (date) => {
  let day = date.getDate();
  let month = date.getMonth() + 1;
  month = month < 10 ? '0' + month : month;
  day = day < 10 ? '0' + day : day;
  const year = date.getFullYear();

  return `${year}-${month}-${day}`;
}
    const artists = ref([]);
    const error = ref({
        message: "",
        errors: {
            name: [""],
            first_release_year: [""],
            no_of_album_release: [""],
            gender: [""],
            dob: [""],
        },
    });
    const artistId = ref(0);
    const vreset = (str) => {
        error.value.errors[str] = [""];
    };
const add = () => {
artistId.value=0;
reset()
resetmodel(true)
}
    const handleFileUpload = (event) => {
        const file = event.target.files[0];
        Swal.fire({
            title: "Are you sure?",
            text: "You you want to store!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes",
        }).then((result) => {
            if (result.isConfirmed) {
        const formData = new FormData();
        formData.append("file", file);
        axios.setHeader();
        axios
            .post("api/artist-import", formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            })
            .then((response) => {
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
                        },
                    });
                    Toast.fire({
                        icon: "success",
                        title: "Artist Imported Created successfully",
                    });
                    getartist(artists.value.currentpage, "");
                }
            });
        }
    });
    };
    const editartist = (data) => {
        reset();
        artist.value.name = data.name;
        artist.value.first_release_year = data.first_release_year;
        artist.value.no_of_album_release = data.no_of_album_release;
        artist.value.dob = data.dob;
        artist.value.gender = data.gender;
        artist.value.address = data.address;
        artistId.value = data.id;
        resetmodel(true);
    };
    const resetmodel = (flag) => {
        const $modalElement = document.querySelector("#default-modal");
        const modalOptions = {
            placement: "bottom-right",
            backdrop: "dynamic",
            backdropClasses: "bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40",
        };

        const modal = new Modal($modalElement, modalOptions);
        if (flag) {
            modal.show();
        } else {
            modal.hide();
        }
    };
    const gotoMusic = (id) => {

        router.push({ name: "artist.music", params: { id: id } }).catch((err) => console.log(err));
    };
    const artist = ref({
        name: "",
        first_release_year: "",
        no_of_album_release: "",
        dob: null,
        gender: null,
        address: "",
        gender: null,
    });
    const exportArtist = () => {
       
        axios.setHeader();
        axios
            .get("api/artist-excel", {
                responseType: "blob",
            })
            .then((response) => {
                const blob = new Blob([response.data], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
                const url = window.URL.createObjectURL(blob);
                const link = document.createElement("a");
                link.href = url;
                link.setAttribute("download", "data.xlsx");
                document.body.appendChild(link);
                link.click();
                link.remove();
            })
            .catch((e) => {
                console.log(e);
            });
    };
    const submitArtist = () => {
        Swal.fire({
            title: "Are you sure?",
            text: "You you want to store!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes",
        }).then((result) => {
            if (result.isConfirmed) {
                axios.setHeader();
                axios
                    .post("api/artist-create", artist.value)
                    .then((response) => {
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
                                },
                            });
                            Toast.fire({
                                icon: "success",
                                title: "Artist Created successfully",
                            });
                            reset();
                            resetmodel(false);
                            getartist(artists.value.currentpage, "");
                        }
                    })
                    .catch((e) => {
                        error.value = e.response.data;
                    });
            }
        });
    };
    const updateArtist = () => {
        Swal.fire({
            title: "Are you sure?",
            text: "You you want to update!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes",
        }).then((result) => {
            if (result.isConfirmed) {
                axios.setHeader();
                axios
                    .put("api/artist-update/" + artistId.value, artist.value)
                    .then((response) => {
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
                                },
                            });
                            Toast.fire({
                                icon: "success",
                                title: "Artist Updated successfully",
                            });
                            reset();
                            resetmodel(false);
                            getartist(artists.value.currentpage, search.value);
                        }
                    })
                    .catch((e) => {
                        error.value = e.response.data;
                    });
            }
        });
    };
    const deleteartist = (id) => {
        Swal.fire({
            title: "Are you sure?",
            text: "You want to delete!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!",
        }).then((result) => {
            if (result.isConfirmed) {
                axios.setHeader();
                axios
                    .delete("api/artist-delete/" + id)
                    .then((response) => {
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
                                },
                            });
                            Toast.fire({
                                icon: "success",
                                title: "Artist Deleted successfully",
                            });
                            getartist(artists.value.currentpage, "");
                        }
                    })
                    .catch((e) => {
                        error.value = e.response.data;
                    });
            }
        });
    };
    const getartist = (pageno = 1, s = "") => {
        search.value = s;
        axios.setHeader();
        axios
            .get("api/get-artist-list", {
                params: {
                    page: pageno,
                    search: s,
                },
            })
            .then((response) => {
                artists.value = response.data;
            })
            .catch((error) => {
                console.log(error.response.data.message);
            });
    };
    const reset = () => {
        artist.value.name = "";
        artist.value.first_release_year = "";
        artist.value.no_of_album_release = "";
        artist.value.dob = "";
        artist.value.gender = "";
        artist.value.address = "";
        error.value = {
            message: "",
            errors: {
                name: [""],
                first_release_year: [""],
                no_of_album_release: [""],
                gender: [""],
                dob: [""],
            },
        };
    };

    onMounted(() => {
        getartist(1, "");
    });
</script>
