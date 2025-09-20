import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  // When deploying into a subfolder (like https://server410581.nazwa.pl/car/)
  // set base to the folder path so built assets reference correct URLs.
  base: '/car/',
  plugins: [react()],
  server: {
    proxy: {
      '/api': 'http://localhost:3001'
    }
  }
})
