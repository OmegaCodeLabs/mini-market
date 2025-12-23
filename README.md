# Mini Market

A modern Rails 8 application built with Vue.js 3, Vite, and Tailwind CSS v4.

## Tech Stack

- **Backend**: Ruby on Rails 8.0.3
- **Frontend Framework**: Vue.js 3.5
- **Build Tool**: Vite 5.4 (via vite_rails gem)
- **Styling**: Tailwind CSS v4
- **Database**: PostgreSQL
- **Package Manager**: pnpm

## Key Integrations

- **Vite + Rails**: Using `vite-plugin-ruby` for seamless Rails integration
- **Vue**: Using `@vitejs/plugin-vue` for Vue SFC compilation
- **Tailwind v4**: Modern CSS-first configuration with PostCSS

## Prerequisites

- Ruby 3.x
- Node.js 18+ (for Vite)
- PostgreSQL
- pnpm (or npm/yarn)

## Setup

1. **Install Ruby dependencies**:
   ```bash
   bundle install
   ```

2. **Install JavaScript dependencies**:
   ```bash
   pnpm install
   ```

3. **Setup database**:
   ```bash
   rails db:create
   rails db:migrate
   ```

## Running the App

Start the development server (runs both Rails and Vite):

```bash
bin/dev
```

This starts:
- Rails server on http://localhost:3000
- Vite dev server with HMR (Hot Module Replacement)

Alternatively, run them separately:
- Rails: `rails server`
- Vite: `bin/vite dev`

### Running on a Different Port

To run Rails on a different port (e.g., 3001):

```bash
# Using bin/dev (edit Procfile.dev and change the port)
# Or run Rails directly:
rails server -p 3001

# Or set the PORT environment variable:
PORT=3001 bin/dev
```

## Project Structure

### Frontend Files
- `app/javascript/entrypoints/` - Vite entrypoints (application.js, application.css)
- `app/javascript/components/` - Vue components (create .vue files here)
- `vite.config.ts` - Vite configuration (plugins, build settings)
- `postcss.config.js` - PostCSS configuration (Tailwind + Autoprefixer)

### Key Configuration Files
- `vite.config.ts` - Configures Vite with Ruby and Vue plugins
- `postcss.config.js` - Enables Tailwind CSS processing
- `package.json` - JavaScript dependencies (use pnpm)
- `Gemfile` - Ruby dependencies (use bundle)

## Using Vue Components

Create `.vue` files in `app/javascript/components/`:

```vue
<template>
  <div class="text-blue-500 font-bold">
    Hello from Vue!
  </div>
</template>

<script setup>
// Your component logic
</script>
```

## Using Tailwind CSS

Tailwind v4 is configured and ready to use. Just add classes:

```html
<div class="flex items-center gap-4 p-6 bg-blue-100 rounded-lg">
  <h1 class="text-2xl font-bold">Hello Tailwind!</h1>
</div>
```

Works in:
- Rails ERB views (`.html.erb`)
- Vue components (`.vue`)
- JavaScript files

## Helpful Commands

```bash
# Install dependencies
pnpm install

# Start dev server
bin/dev

# Rails console
rails console

# Run migrations
rails db:migrate

# Generate Rails scaffold
rails generate scaffold Product name:string price:decimal

# Check routes
rails routes
```

## Deployment

This app is configured for deployment with Kamal. See `config/deploy.yml` for deployment settings.

## Notes

- Vite provides instant HMR for Vue components during development
- Tailwind automatically scans files and generates only the CSS you use
- The app uses Rails 8's default stack with Vite replacing the asset pipeline
