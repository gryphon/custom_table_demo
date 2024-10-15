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

import TableController from "custom_table/app/javascript/controllers/table_controller.js"
application.register("table", TableController)

import BatchActionsController from "custom_table/app/javascript/controllers/batch_actions_controller.js"
application.register("batch-actions", BatchActionsController)

import FlatpickrController from "custom_table/app/javascript/controllers/flatpickr_controller.js"
application.register("flatpickr", FlatpickrController)

import SortableController from "custom_table/app/javascript/controllers/sortable_controller.js"
application.register("sortable", SortableController)
 