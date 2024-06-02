import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import router from './router'
// import axios from 'axios'
import VueAxios from 'vue-axios'
import axios from './axios';
const pinia = createPinia();

const app = createApp(App)
app.config.globalProperties.$http = axios;
app.use(pinia)
app.use(VueAxios, axios)
app.use(router)

app.mount('#app')
