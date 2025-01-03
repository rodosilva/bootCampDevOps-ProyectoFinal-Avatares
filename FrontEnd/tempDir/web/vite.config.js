import { defineConfig } from 'vite'
import reactRefresh from '@vitejs/plugin-react-refresh'

export default defineConfig({

  logLevel: 'info',

  plugins: [reactRefresh()],
  server: {
    host: process.env.VITE_HOST || null,
    port: process.env.VITE_PORT || null,
    hmr: {
      clientPort: process.env.VITE_CLIENT_PORT || null
    },
    proxy: {
      '^/api': {
        //target: 'http://api',
        target: 'http://avatares-back:5000', //Dirección IP (Hostname) del contenedor de la API Backend
        changeOrigin: true
      }
    }
  }
})
