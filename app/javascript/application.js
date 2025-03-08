// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import { Turbo } from "@hotwired/turbo-rails"

//= require jquery
//= require jquery_ujs
//= require @hotwired/turbo-rails
Turbo.session.drive = true
import { Turbo } from "@hotwired/turbo-rails"
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap

import "./add_jquery.js"
  
console.log("Hello from app/javascript/application.js")

import {TabulatorFull as Tabulator} from 'tabulator-tables';
window.Tabulator = Tabulator;
