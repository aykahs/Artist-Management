import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import backendlayout from '../components/layouts/app.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: Login
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/Register.vue')
    },
    {
      path: '/admin',
      name: "backend",
      component:backendlayout,
      children: [
        {
          path: 'dashboard', 
          name: 'dashboard',
          component: () => import('../views/backend/Dashboard.vue')
        },
        {
          path: 'users', 
          name: 'users',
          component: () => import('../views/backend/Users.vue')
        }
      ]
    },
  ]
})

export default router
