import { createRouter, createWebHistory } from 'vue-router';
import LoginView from '@/modules/auth/views/LoginView.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Login',
      component: LoginView,
    },
    {
      path: '/crud',
      name: 'Crud',
      component: () => import('@/modules/CRUD/views/CrudView.vue'),
    },
  ],
});

export default router;
