// Get the modal
var modal = document.getElementById('myModal-edit');
var banner = document.querySelector('.background-banner-overlay');

// Get the button that opens the modal
var btn = document.getElementById("login-btn");
var btn2 = document.getElementById("signup-btn")

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
    modal.style.display = "block";
    banner.style.width = "100%";
    // document.getElementById('render-area').innerHTML = '<%= render 'shared/login-form' %>'
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
    banner.style.width = "0%";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == banner) {
        modal.style.display = "none";
        banner.style.width = "0%";
    }
}
