/**
 * PostCSS Configuration
 *
 * PostCSS processes CSS files through plugins that transform the styles.
 * This config is automatically used by Vite when processing CSS files.
 *
 * Plugins:
 * - tailwindcss: Processes Tailwind directives (@import "tailwindcss") and generates utility classes
 * - autoprefixer: Automatically adds vendor prefixes (-webkit-, -moz-, etc.) for browser compatibility
 */
export default {
  plugins: {
    tailwindcss: {},    // Enables Tailwind CSS v4 processing
    autoprefixer: {},   // Adds browser prefixes automatically
  },
}
