import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from '../axios';

import myToken from '../mytoken'

export const Auth = defineStore('auth', () => {
    const user = ref({})
    const isAuthenticated = ref(false)
    const token = ref('')
    const error = ref('')

    function login(data) {
        return new Promise((resolve, reject) => {

            axios.post('api/login', data).then((response) => {
                if (response.status == 200) {
                    user.value = response.data.user;
                    token.value = response.data.token;
                    isAuthenticated.value = true;
                    myToken.saveToken(response.data.token);
                    resolve(response);
                }
            }).catch((e) => {
                reject(e.response.data);
            })
        });
    }
    function me(){
        return new Promise((resolve, reject) => {
            axios.setHeader();
            axios.get('api/user').then((response) => {
                if (response.status == 200) {
                    user.value = response.data;
                    token.value = myToken.getToken();
                    isAuthenticated.value = true;
                    resolve(response);
                }
            }).catch((e) => {
                reject(e.response.data);
            })
        });
    }

    return { login,user,isAuthenticated,me }
})
