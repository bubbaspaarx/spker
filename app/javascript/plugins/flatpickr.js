import flatpickr from 'flatpickr'
import "flatpickr/dist/themes/material_green.css"

flatpickr(".datepicker", {
  altInput: true
})

flatpickr(".timepicker", {
  enableTime: true,
  noCalendar: true,
  time_24hr: true,
  minuteIncrement: 15
})
