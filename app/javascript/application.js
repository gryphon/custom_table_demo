// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "bootstrap"

import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application

import RemoteModalController from "turbo_remote_modal/app/javascript/controllers/remote_modal_controller.js";
application.register("remote-modal", RemoteModalController)
