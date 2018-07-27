const photoInput = document.getElementById("photo-input");

photoInput.addEventListener("change", event => {
  if (photoInput.files && photoInput.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $("#img_prev").css("background-image", `url(${e.target.result})`);
      $(".photo-save-btn").css("display", "block");
    };

    reader.readAsDataURL(photoInput.files[0]);
  }
});
