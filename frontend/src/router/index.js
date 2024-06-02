import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import backendlayout from '../components/layouts/app.vue'
import { Auth } from "../stores/auth.js"

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'login',
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/Register.vue'),
      meta: {
        requiresAuth: false
      }
    },
    {
      path: '/admin',
      name: "backend",
      component: backendlayout,
      children: [
        {
          path: 'dashboard',
          name: 'dashboard',
          component: () => import('../views/backend/Dashboard.vue'),
          meta: {
            requiresAuth: true
          }

        },
        {
          path: 'users',
          name: 'users',
          component: () => import('../views/backend/Users.vue'),
          meta: {
            requiresAuth: true
          }
        }
      ]
    },
  ]
})

router.beforeEach((to, from, next) => {
    console.log(to, from)
    const auth = Auth();
    if (to.matched.some(record => record.meta.requiresAuth)) {
      auth.me().then((res) => {
        if (res.status == 200) {
          next();
        }
      }).catch(() => {
        next({
          name: 'login'
        });
      });
      
    } else {
      if(auth.isAuthenticated){
        next({
          name: 'dashboard'
        });
      }else{
        next();
      }
    }
  });
export default router
