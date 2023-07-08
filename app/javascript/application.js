// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true
import "controllers"
import "@hotwired/turbo-rails"
  
console.log("Hello from app/javascript/application.js")

