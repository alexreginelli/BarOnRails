# config/puma.rb

# Puma can listen on the port provided by Heroku
port        ENV.fetch("PORT") { 3000 }

# Set the environment to production (Heroku defaults to this)
environment ENV.fetch("RAILS_ENV") { "production" }

# Threads and workers setup
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Preload the app for efficiency
preload_app!

# Set worker processes for concurrency (Heroku Basic supports 1 worker)
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Allow Puma to restart on `rails restart`
plugin :tmp_restart