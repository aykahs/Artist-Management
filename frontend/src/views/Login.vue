<template>
  <section>
    <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto md:h-screen pt:mt-0 dark:bg-gray-900">

      <div class="w-full max-w-xl p-6 space-y-8 sm:p-8 bg-white rounded-lg shadow dark:bg-gray-800">
        <h2 class="text-2xl font-bold text-gray-900 dark:text-white">
          Sign in
        </h2>
        <form class="mt-8 space-y-6" @submit.prevent="Login">
          <div>
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
            <input type="email" name="email" id="email" v
              class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
              placeholder="name@company.com" v-model="user.email" required>
            <span class="mt-2 text-sm text-red-600 dark:text-red-500" v-if="error.message && error.message != ''">{{
                error.message
              }}</span>
          </div>
          <div>
            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your
              password</label>
            <input type="password" name="password" id="password" placeholder="••••••••"
              class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
              v-model="user.password" required>
          </div>
          <button type="submit"
            class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">Login</button>
          <!-- <button type="submit" class="w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" @click="login">Login to your account</button> -->
          <div class="text-sm font-medium text-gray-500 dark:text-gray-400">
            Not registered?
            <RouterLink to="/register" class="text-primary-700 hover:underline dark:text-primary-500">Create account
            </RouterLink>
          </div>
        </form>
      </div>
    </div>

  </section>
</template>

<script setup>
import { ref } from "vue";
import { Auth } from "../stores/auth.js"
import { useRouter } from 'vue-router';
const router = useRouter();

const user = ref({
  email: '',
  password: ''
})

const error = ref({
  "message": "",
  "errors": {
    "password": [
      ""
    ],
    "email": [
      ""
    ]
  }
})
const Login = () => {
  const auth = Auth();
  auth.login(user.value).then((res) => {
    if (res.status == 200) {
      router.push({ name: 'dashboard' })
    }
  }).catch((err) => {
    error.value = err
  })}
</script>