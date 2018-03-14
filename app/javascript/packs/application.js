import swal from 'sweetalert';
import '../plugins/flatpickr'
import 'bootstrap'
import '../components/login-form.js'
import { formAlerts, dynamicPrice } from "../components/booking_form.js";
// import '../components/modal.js'
import { autocomplete } from '../components/autocomplete.js';

autocomplete();

formAlerts();
if (price) {
  dynamicPrice(price)
}


