// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";
import { countStations } from '../plugins/display_counter';
import { initUpdateNavbarOnScroll } from '../plugins/navbar';
import { initTabs } from '../plugins/init_tabs';


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  countStations();
  initUpdateNavbarOnScroll();
  initTabs();
});
