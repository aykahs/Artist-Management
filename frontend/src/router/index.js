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
        },
        {
          path: 'artist',
          name: 'artist',
          component: () => import('../views/backend/Artist.vue'),
          meta: {
            requiresAuth: true
          }
        },
        {
          path: 'artist/:id/music',
          name: 'artist.music',
          component: () => import('../views/backend/Music.vue'),
          meta: {
            requiresAuth: true
          }
        }
      ]
    },
  ]
})

router.beforeEach((to, from, next) => {
    const auth = Auth();
    if (to.matched.some(record => record.meta.requiresAuth)) {
      auth.me().then((res) => {
        if (res.status == 200) {
          next();
        }
      }).catch(() => {
        auth.destroy()
        next({
          name: 'login'
        });
      });
      
    } else {
      auth.isLogin()
      if(auth.isAuthenticated){
        next({
          name: 'dashboard'
        });
      }else{
        auth.destroy()
        next();
      }
    }
  });
export default router
