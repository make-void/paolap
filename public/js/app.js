var gal_anim, gal_resize;

window.cur_idx = 0;

gal_anim = function(elements) {
  var time,
    _this = this;
  time = 6000;
  return setTimeout(function() {
    var cond, cur_idx, images, next_idx;
    images = elements;
    window.elements = elements;
    cur_idx = window.cur_idx;
    cond = cur_idx >= images.length - 1;
    next_idx = cond ? 0 : cur_idx + 1;
    elements[cur_idx].style.opacity = 0;
    elements[next_idx].style.opacity = 1;
    window.cur_idx = cond ? 0 : cur_idx + 1;
    return gal_anim(elements);
  }, time);
};

gal_resize = function() {
  var set_size;
  set_size = function() {
    var bg, images;
    bg = ".home .content .bg";
    bg = document.querySelector(bg);
    images = ".home .content .bg img";
    images = document.querySelectorAll(images);
    console.log("resize");
    bg.style.height = images[0].height;
    console.log(bg.style.height);
    return console.log(images[0].height);
  };
  window.addEventListener('resize', set_size);
  return set_size();
};

$(function() {
  var images;
  $(".gallery").fancybox();
  images = ".home .content .bg img";
  images = document.querySelectorAll(images);
  if (images.length > 0) {
    gal_anim(images);
    return gal_resize();
  }
});
