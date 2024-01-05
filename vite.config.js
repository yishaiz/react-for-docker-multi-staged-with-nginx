import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
})


// vite.config.js
export default {
  server: {
    port: 3000, // Specify the port you want to use
  },
};