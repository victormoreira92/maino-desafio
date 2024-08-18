// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import * as jquery from "jquery"
import Swal from 'sweetalert2';
import "jquery-validation"
import "jquery-validation/dist/additional-methods.min"
import "jquery-validation/dist/localization/messages_pt_BR.min"
import List from 'list.js';
import "./alert"
import "./validation_form"

window.Swal = Swal;
