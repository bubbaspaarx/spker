function autocomplete() {
  document.addEventListener("DOMContentLoaded", function(){
    var speakerAddress = document.querySelectorAll("#banner-searchbar, #searchbar, #filter-location, #event_address");
    for (var i = 0, len = speakerAddress.length; i < len; i++) {
      if(speakerAddress[i]) {
        var autocomplete = new google.maps.places.Autocomplete(speakerAddress[i], {
          types: [ 'geocode' ] });
        google.maps.event.addDomListener(speakerAddress[i], 'keydown', function(e) {
          if (e.key === 'Enter'){
            // const arr = document.querySelectorAll("div.pac-item")
            // const searchbar = document.getElementById('searchbar')
            // searchbar.value = arr[0].children[1].innerText + ', ' + arr[0].children[2].innerText


            // google.maps.event.trigger({ type : 'keypress', which : 40 })
            // const allDropdown = document.querySelectorAll('div.pac-item')
            // console.log(allDropdown);

            //
            //
          }
        });
      }
    }
  });
}

export { autocomplete }
