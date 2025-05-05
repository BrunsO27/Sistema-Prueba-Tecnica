import { createRouter, createWebHistory } from 'vue-router';
import CrudView from '@/modules/CRUD/views/CrudView.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Crud',
      component: CrudView,
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/modules/auth/views/LoginView.vue'),
    },
  ],
});

export default router;
