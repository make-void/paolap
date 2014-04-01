var gal_anim, gal_anim_callback, gal_resize, set_home_height;

window.cur_idx = 0;

gal_anim_callback = function() {};

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
    gal_anim_callback(next_idx);
    window.cur_idx = cond ? 0 : cur_idx + 1;
    window.cur_img = elements[next_idx];
    window.set_size();
    return gal_anim(elements);
  }, time);
};

gal_anim_callback = function(idx) {
  return setTimeout(function() {
    var elem;
    $(".home_text div").css({
      opacity: 0
    });
    elem = $(".home_text div[data-idx=" + idx + "]");
    return elem.css({
      opacity: 1
    });
  }, 200);
};

gal_resize = function() {
  var set_size;
  set_size = function() {
    var fill_height, fill_width, img, img_height, img_ratio, img_width, win_height, win_ratio, win_width;
    img = window.cur_img;
    win_width = $(window).width();
    img_width = img.width;
    img_height = img.height;
    win_height = $(window).height();
    win_ratio = $(window).width() / win_height;
    img_ratio = img.width / img.height;
    fill_height = win_height;
    fill_width = win_height * img_ratio;
    img = ".home .content .bg img";
    if (img_ratio > win_ratio) {
      $(img).height(win_height);
      $(img).width('auto');
      return $(img).css({
        left: -(fill_width - win_width) / 2,
        top: 0
      });
    } else {
      fill_height = win_width / img_ratio;
      $(img).width(win_width);
      $(img).height('auto');
      return $(img).css({
        top: -(fill_height - win_height) / 2,
        left: 0
      });
    }
  };
  window.set_size = set_size;
  window.addEventListener('resize', set_size);
  return set_size();
};

set_home_height = function() {
  return $(".inner").css({
    minHeight: $(window).height() - 200
  });
};

$(function() {
  var images;
  $(".gallery").fancybox();
  images = ".home .content .bg img";
  images = document.querySelectorAll(images);
  window.cur_img = images[0];
  if (images.length > 0) {
    gal_anim(images);
    gal_resize();
  }
  set_home_height();
  return window.addEventListener('resize', set_home_height);
});
