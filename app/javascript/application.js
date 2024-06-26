// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers";

// import 'trix';
// import "@rails/actiontext"; // needed for trix
// import "tributejs";

import "trix"
import "@rails/actiontext"

// import 'flowbite';

import { application } from "controllers/application" // or equivalent

import HwComboboxController from "controllers/hw_combobox_controller"
application.register("hw-combobox", HwComboboxController)
