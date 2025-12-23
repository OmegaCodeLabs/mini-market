/**
 * Vite Application Entrypoint
 *
 * This is the main JavaScript entry point for the application.
 * Vite processes this file and all its imports, then serves it to the browser.
 *
 * To use in Rails views, add to app/views/layouts/application.html.erb:
 *    <%= vite_client_tag %>
 *    <%= vite_javascript_tag 'application' %>
 *
 * For TypeScript: <%= vite_typescript_tag 'application' %>
 * For JSX/TSX: <%= vite_javascript_tag 'application.jsx' %>
 */

// Import Tailwind CSS - this loads all Tailwind styles via PostCSS
// PostCSS processes this through tailwindcss plugin (see postcss.config.js)
import './application.css'

console.log('Vite ⚡️ Rails')
console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// ===================================
// OPTIONAL: Import Rails Libraries
// ===================================
// Uncomment these if you want to use Hotwire Turbo or ActiveStorage:
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()

// ===================================
// OPTIONAL: Import Vue Components
// ===================================
// Example: Import and mount a Vue app globally
//
// import { createApp } from 'vue'
// import App from '../components/App.vue'
//
// const app = createApp(App)
// app.mount('#app')

// ===================================
// OPTIONAL: Auto-import Action Cable Channels
// ===================================
// const channels = import.meta.glob('./**/*_channel.js', { eager: true })