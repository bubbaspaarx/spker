var login_modal = document.getElementById('myModal');
var signup_modal = document.getElementById('mySignupModal');
var banner = document.querySelector('.background-banner-overlay');

// Get the button that opens the modal
var login_btn = document.getElementById("login-btn");
var signup_btn = document.getElementById("signup-btn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close-1")[0];
var span1 = document.getElementsByClassName("close-2")[0];

// When the user clicks on the button, open the modal
login_btn.onclick = function() {
  login_modal.style.display = "block";
  banner.style.width = "100%";
}

signup_btn.onclick = function() {
  signup_modal.style.display = "block";
  banner.style.width = "100%";
}

// When the user clicks on <span> (x), close the login_modal
span.onclick = function() {
  login_modal.style.display = "none";
  signup_modal.style.display = "none";
  banner.style.width = "0%";
}
span1.onclick = function() {
  login_modal.style.display = "none";
  signup_modal.style.display = "none";
  banner.style.width = "0%";
}

// When the user clicks anywhere outside of the login_modal, close it
window.onclick = function(event) {
  if (event.target == banner) {
    login_modal.style.display = "none";
    signup_modal.style.display = "none";
    banner.style.width = "0%";
  }
}
