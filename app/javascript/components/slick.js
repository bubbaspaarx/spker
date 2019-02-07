// $('.speaker_image_carousel').slick({
//   slidesToShow: 1,
//   slidesToScroll: 1,
//   arrows: false,
//   fade: true,
//   asNavFor: '.slider-nav',
// });
$('.speaker-nav-images').slick({
  slidesToShow: 3,
  slidesToScroll: 2,
  asNavFor: '.speaker-image-gallery',
  dots: true,
  centerMode: false,
  focusOnSelect: true
});

$('.speaker-image-gallery').slick({
  infinite: false
});
