// $('.speaker_image_carousel').slick({
//   slidesToShow: 1,
//   slidesToScroll: 1,
//   arrows: false,
//   fade: true,
//   asNavFor: '.slider-nav',
// });
$('.speaker-nav-images').slick({
  rows: 0,
  slidesToShow: 6,
  slidesToScroll: 1,
  asNavFor: '.speaker-image-gallery',
  dots: true,
  centerMode: false,
  focusOnSelect: true
});

$('.speaker-image-gallery').slick({
  infinite: false
});
