const pad = (num) => {
  if (num.length < 2) {
   num = '0' + num
  }
  return num
}

const arrayToDatetime = (array) => {
  return `${pad(array[0])}:${pad(array[1])}:00`
}

const getTimeFromInputs = (form) => {
  const inputs = form.querySelectorAll('.form-inline')
  const startArray = []
  const endArray = []
  inputs[0].querySelectorAll('.form-control').forEach((input) => {
    startArray.push(input.value)
  })
  console.log(startArray)
  inputs[1].querySelectorAll('.form-control').forEach((input) => {
    endArray.push(input.value)
  })
  console.log(endArray)
  const startTime = Date.parse('01 Jan 1970 ' + arrayToDatetime(startArray) + ' GMT')
  const endTime = Date.parse('01 Jan 1970 ' + arrayToDatetime(endArray) + ' GMT')
  return [startTime, endTime]

}

const dynamicPrice = (price) => {
  const form = document.getElementById('new_message')
  const inputs = form.querySelectorAll('.time')
  console.log(inputs)
  const cost = document.getElementById('id-price')
  inputs.forEach((input) => {
    input.addEventListener('change', (event) => {
      const timeArray = getTimeFromInputs(form)
      let hours = Math.round((timeArray[1] - timeArray[0]) / 3600000)
      console.log(hours)
      if (hours < 1) { hours = 1 }
      cost.innerText =`Price: £${Math.round(price) * hours}.00`
    })
  })
}

const formAlerts = () => {
  const form = document.getElementById('new_message')
  if (form) {
    const btn = form.querySelector('.btn-primary')
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const timeArray = getTimeFromInputs(form)
      if (timeArray[0] < Date.now()) {
        swal({title: "Error!", text: "You can't book an event in the past", icon:"error"})
          .then((value) => { btn.removeAttribute('disabled') })
      } else if (timeArray[0] > timeArray[1]) {
        swal({title: "Error!", text: "The event must start before it ends", icon:"error"})
          .then((value) => { btn.removeAttribute('disabled') })
      } else {
        swal({ title: "Booking confirmed", icon: "success"})
          .then((value) => { form.submit() })
      }

    })
  }
}

export { formAlerts, dynamicPrice }
