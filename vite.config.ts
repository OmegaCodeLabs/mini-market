/**
 * Vite Configuration
 *
 * Vite is a modern build tool that provides:
 * - Fast dev server with Hot Module Replacement (HMR)
 * - Optimized production builds
 * - Plugin system for framework integration
 *
 * This configuration connects Vite with Rails and enables Vue.js support.
 */
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [
    // vite-plugin-ruby: Integrates Vite with Rails
    // - Connects Vite dev server to Rails
    // - Handles asset compilation and serving
    // - Enables <%= vite_javascript_tag %> helpers in Rails views
    RubyPlugin(),

    // @vitejs/plugin-vue: Compiles Vue Single File Components (.vue)
    // - Transforms <template>, <script>, <style> blocks
    // - Enables Hot Module Replacement for Vue components
    // - Required to use .vue files in the project
    vue(),
  ],
})
