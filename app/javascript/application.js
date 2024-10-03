import "@hotwired/turbo-rails"
Turbo.session.drive = false;
import "@rails/ujs"
import "./controllers"
import "bootstrap"

// Initialize Rails UJS
import Rails from "@rails/ujs"
Rails.start()