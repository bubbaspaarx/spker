import '../plugins/flatpickr'
import 'bootstrap'
import { formAlerts, dynamicPrice } from "../components/booking_form.js";

formAlerts();
if (price) {
  dynamicPrice(price)
}
