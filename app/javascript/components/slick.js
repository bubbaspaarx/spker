$('.speaker_image_carousel').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.slider-nav',
});
$('.slider-nav').slick({
  slidesToShow: 3,
  slidesToScroll: 1,
  asNavFor: '.speaker_image_carousel',
  dots: true,
  centerMode: true,
  focusOnSelect: true
});
