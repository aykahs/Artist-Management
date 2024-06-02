import axios from 'axios';
import { getToken } from './mytoken';

const ApiService = {
  // Create the Axios instance
  axiosInstance: axios.create({
    baseURL: import.meta.env.VITE_URL || 'http://localhost:3000', 
  }),

  setHeader() {
    const token = getToken();
    if (token) {
      this.axiosInstance.defaults.headers.common['Authorization'] = `Bearer ${token}`;
    }
  },

  get(resource,data) {
    return this.axiosInstance.get(resource,data);
  },

  post(resource, data) {
    return this.axiosInstance.post(resource, data);
  },

  put(resource, data) {
    return this.axiosInstance.put(resource, data);
  },

  delete(resource) {
    return this.axiosInstance.delete(resource);
  }
};

export default ApiService;
