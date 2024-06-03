<template>
  <section>
    <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto  pt:mt-0 dark:bg-gray-900">
      <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
        <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
          Create a Free Account
        </h2>
        <form  @submit.prevent="submitUser">
        <div>
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
          <input @input="vreset('username')" v-model="user.username" type="text" name="firstname" id="name"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.username && error.errors.username[0] != ''">{{
            error.errors.username[0]
          }}</span>
        </div>
        <div>
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">First
            Name</label>
          <input @input="vreset('first_name')" v-model="user.first_name" type="text" name="firstname" id="name"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.first_name && error.errors.first_name[0] != ''">{{
            error.errors.first_name[0]
          }}</span>
        </div>
        <div>
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Last
            Name</label>
          <input @input="vreset('last_name')" v-model="user.last_name" type="text" name="lastname" id="lastname"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.last_name && error.errors.last_name[0] != ''">{{
            error.errors.last_name[0]
          }}</span>
        </div>

        <div>
          <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
            Email</label>
          <input @input="vreset('email')" v-model="user.email" type="email" name="email" id="email"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="@company.com" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.email && error.errors.email[0] != ''">{{
            error.errors.email[0]
          }}</span>
        </div>
        <div>
          <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
            Phone No</label>
          <input @input="vreset('phone')" v-model="user.phone" type="number" name="phone" id="phone"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.phone && error.errors.phone[0] != ''">{{
            error.errors.phone[0]
          }}</span>
        </div>
        <div>
          <label for="dob" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
            Date of birth</label>
          <!-- <input @input="vreset('dob')" v-model="user.dob" type="date" name="dob" id="dob"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required> -->
            <VueDatePicker @update:model-value="vreset('dob')" v-model="user.dob" :format="format"></VueDatePicker>

          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.dob && error.errors.dob[0] != ''">{{
            error.errors.dob[0]
          }}</span>
        </div>
        <div>
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Address</label>
          <input @input="vreset('address')" v-model="user.address" type="text" name="address" id="address"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="" required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.address && error.errors.address[0] != ''">{{
            error.errors.address[0]
          }}</span>
        </div>
        <div>
          <label for="gender" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Select
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
        <div>
          <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
            password</label>
          <input @input="vreset('password')" type="password" v-model="user.password" name="password" id="password"
            placeholder=""
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            required>
          <span class="mt-2 text-sm text-red-600 dark:text-red-500"
            v-if="error.errors.password && error.errors.password[0] != ''">{{
            error.errors.password[0]
          }}</span>
        </div>
        <div>
          <label for="confirm-password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Confirm
            password</label>
          <input v-model="user.password_confirmation" type="password" name="confirm-password" id="confirm-password"
            placeholder=""
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            required>
        </div>
        <button type="submit"
          class="mt-2 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Create
          account</button>
        <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
          Already have an account?
          <RouterLink to="/" class="text-primary-700 hover:underline dark:text-primary-500">Login
            here</RouterLink>
        </div>
        </form>
      </div>
    </div>
  </section>
</template>
<script setup>
import { ref, onMounted, reactive, computed } from "vue";
import axios from '../axios';
import Swal from 'sweetalert2'
import { useRouter } from 'vue-router';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
const router = useRouter();

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
const vreset = (str) => {
  error.value.errors[str] = [''];
}
const format = (date) => {
  let day = date.getDate();
  let month = date.getMonth() + 1;
  month = month < 10 ? '0' + month : month;
  day = day < 10 ? '0' + day : day;
  const year = date.getFullYear();

  return `${year}-${month}-${day}`;
}
const submitUser = () => {
  Swal.fire({
    title: "Are you sure?",
    text: "You you want to submit!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Yes"
  }).then((result) => {
    if (result.isConfirmed) {
      axios.post('api/register', user.value).then((response) => {
        if (response.status == 200) {
          reset();
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
            title: "Registered  successfully"
          });

          router.push({ name: 'login' })
        }
      }).catch((e) => {
        error.value = e.response.data
      })
    }
  });
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
</script>