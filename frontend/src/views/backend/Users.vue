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
                                        User
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
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
                                        <input @input="vreset('username')" v-model="user.username" type="text"
                                            name="firstname" id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.username && error.errors.username[0] != ''">{{
                                        error.errors.username[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="name"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First
                                            Name</label>
                                        <input @input="vreset('first_name')" v-model="user.first_name" type="text"
                                            name="firstname" id="name"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.first_name && error.errors.first_name[0] != ''">{{
                                        error.errors.first_name[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="name"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last
                                            Name</label>
                                        <input @input="vreset('last_name')" v-model="user.last_name" type="text"
                                            name="lastname" id="lastname"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.last_name && error.errors.last_name[0] != ''">{{
                                        error.errors.last_name[0]
                                    }}</span>
                                    </div>

                                    <div>
                                        <label for="email"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                                            Email</label>
                                        <input @input="vreset('email')" v-model="user.email" type="email" name="email"
                                            id="email"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="@company.com" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.email && error.errors.email[0] != ''">{{
                                        error.errors.email[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="phone"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                                            Phone No</label>
                                        <input @input="vreset('phone')" v-model="user.phone" type="number" name="phone"
                                            id="phone"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.phone && error.errors.phone[0] != ''">{{
                                        error.errors.phone[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="dob"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                                            Date of birth</label>
                                            <VueDatePicker  @update:model-value="vreset('dob')" v-model="user.dob" :format="format"></VueDatePicker>

                                        <!-- <input @input="vreset('dob')" v-model="user.dob" type="date" name="dob" id="dob"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required> -->
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.dob && error.errors.dob[0] != ''">{{
                                        error.errors.dob[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="name"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
                                        <input @input="vreset('address')" v-model="user.address" type="text"
                                            name="address" id="address"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            placeholder="" required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.address && error.errors.address[0] != ''">{{
                                        error.errors.address[0]
                                    }}</span>
                                    </div>
                                    <div>
                                        <label for="gender"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select
                                            an option</label>
                                        <select @change="vreset('gender')" id="gender" v-model="user.gender"
                                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                                            <option selected>Choose a Gender</option>
                                            <option value="m">Male</option>
                                            <option value="f">Female</option>
                                            <option value="o">Other</option>
                                        </select>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.gender && error.errors.gender[0] != ''">{{
                                        error.errors.gender[0]
                                    }}</span>
                                    </div>
                                    <div v-if="userId == 0">
                                        <label for="password"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
                                            password</label>
                                        <input @input="vreset('password')" type="password" v-model="user.password"
                                            name="password" id="password" placeholder=""
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            required>
                                        <span class="mt-2 text-sm text-red-600 dark:text-red-500"
                                            v-if="error.errors.password && error.errors.password[0] != ''">{{
                                        error.errors.password[0]
                                    }}</span>
                                    </div>
                                    <div v-if="userId == 0">
                                        <label for="confirm-password"
                                            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm
                                            password</label>
                                        <input v-model="user.password_confirmation" type="password"
                                            name="confirm-password" id="confirm-password" placeholder=""
                                            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                                            required>
                                    </div>
                                </div>
                                <!-- Modal footer -->
                                <div
                                    class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                                    <button v-if="userId == 0" type="button" @click="submitUser"
                                        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">ADD</button>
                                    <button v-else type="button" @click="updateUser"
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
                                <button @click="add"
                                    class="block text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                                    type="button">
                                    Add User
                                </button>

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
                                <input type="text" id="table-search-users"
                                    @change="getusers(users.currentpage, $event.target.value)"
                                    class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                    placeholder="search users">
                            </div>
                        </div>
                        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400 ">
                            <thead
                                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        First Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Last Name
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Email
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Phone No
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
                                <tr v-for="user in users.data"
                                    class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                                    <th scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ user.first_name }}
                                    </th>
                                    <td class="px-6 py-4">
                                        {{ user.last_name }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ user.email }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ user.phone }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ user.address }}
                                    </td>
                                    <td class="px-6 py-4">
                                        <a href="#"
                                            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-2 py-1 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                                            @click="edituser(user)">Edit</a>
                                        <a href="#"
                                            class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-3 ml-2 py-1 me-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                                            @click="deleteUser(user.id)">Delete</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <Paginate :currentpage="users.currentpage" :perpage="users.perpage" :total="users.total"
                            :search="search" @loadDate="getusers" />

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
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'

const users = ref([])
const error = ref({
    "message": "",
    "errors": {
        "first_name": [
            ""
        ],
        "last_name": [
            ""
        ],
        "email": [
            ""
        ],
        "phone": [
            ""
        ],
        "dob": [
            ""
        ],
        "address": [
            ""
        ],
        "gender": [
            ""
        ],
        "password": [
            ""
        ],
        "password": [
            ""
        ],
        "username": [
            ""
        ],

    }
})
const userId = ref(0);
const search = ref('');

const vreset = (str) => {
    error.value.errors[str] = [''];
}
const add = () => {
reset()
userId.value = 0;
resetmodel(true)
}
const format = (date) => {
  let day = date.getDate();
  let month = date.getMonth() + 1;
  month = month < 10 ? '0' + month : month;
  day = day < 10 ? '0' + day : day;
  const year = date.getFullYear();

  return `${year}-${month}-${day}`;
}
const edituser = (data) => {
    reset();
    user.value.first_name = data.first_name;
    user.value.last_name = data.last_name;
    user.value.email = data.email;
    user.value.phone = data.phone;
    user.value.dob = data.dob;
    user.value.address = data.address;
    user.value.gender = data.gender;
    user.value.username = data.username;
    userId.value = data.id;
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
const user = ref({
    first_name: '',
    last_name: '',
    email: '',
    phone: '',
    dob: null,
    address: '',
    gender: null,
    password: '',
    password_confirmation: '',
    username: ''

})

const submitUser = () => {
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
            axios.post('api/user-create', user.value).then((response) => {
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
                        title: "User Created successfully"
                    });
                    reset();
                    resetmodel(false)
                    getusers(users.value.currentpage, '')
                }
            }).catch((e) => {
                error.value = e.response.data
            })
        }
    });

}
const updateUser = () => {
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
    axios.put('api/user-update/' + userId.value, user.value).then((response) => {
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
                title: "User Updated successfully"
            });
            reset();
            resetmodel(false)
            getusers(users.value.currentpage, search.value)
        }
    }).catch((e) => {
        error.value = e.response.data;
    })
}
});
}
const deleteUser = (id) => {
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
            axios.delete('api/user-delete/' + id).then((response) => {
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
                        title: "User Deleted successfully"
                    });
                    getusers(users.value.currentpage, '')
                }
            }).catch((e) => {
                error.value = e.response.data;
            })
        }
    });

}
const getusers = (pageno = 1, s = '') => {
    search.value = s;
    axios.setHeader()
    axios.get('api/get-users', {
        params: {
            page: pageno,
            search: s
        }
    }).then((response) => {
        users.value = response.data;
    }).catch((error) => {
        console.log(error.response.data.message);
    })
}
const reset = () => {
    user.value.first_name = '';
    user.value.last_name = '';
    user.value.email = '';
    user.value.phone = '';
    user.value.dob = '';
    user.value.address = '';
    user.value.gender = '';
    user.value.password = '';
    user.value.password_confirmation = '';
    user.value.username = '';
    error.value = {
        "message": "",
        "errors": {
            "first_name": [
                ""
            ],
            "last_name": [
                ""
            ],
            "email": [
                ""
            ],
            "phone": [
                ""
            ],
            "dob": [
                ""
            ],
            "address": [
                ""
            ],
            "gender": [
                ""
            ],
            "password": [
                ""
            ],
            "password": [
                ""
            ],
            "username": [
                ""
            ],

        }
    };
}

onMounted(() => {
    getusers(1, '')
})
</script>