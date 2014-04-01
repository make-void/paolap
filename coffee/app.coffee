

window.cur_idx = 0

gal_anim_callback = ->

# remember to add this css to the img element: transition: opacity 1s ease-in-out
gal_anim = (elements) ->
  time = 6000

  setTimeout =>
    images = elements
    window.elements = elements
    cur_idx = window.cur_idx
    cond = cur_idx >= images.length-1
    next_idx = if cond then 0 else cur_idx+1
    elements[cur_idx].style.opacity = 0
    elements[next_idx].style.opacity = 1
    gal_anim_callback(next_idx)
    #console.log(elements[next_idx])
    #console.log "hiding #{cur_idx}, showing #{next_idx}"
    window.cur_idx = if cond then 0 else cur_idx + 1

    window.cur_img = elements[next_idx]
    window.set_size()

    gal_anim elements
  , time

gal_anim_callback = (idx) -> # overridden
  setTimeout ->
    $(".home_text div").css opacity: 0
    elem = $(".home_text div[data-idx=#{idx}]")
    elem.css opacity: 1
  , 200


gal_resize = ->


  set_size = ->
    img = window.cur_img

    win_width   = $(window).width()
    img_width   = img.width
    img_height  = img.height
    win_height  = $(window).height()
    win_ratio   = $(window).width() / win_height
    img_ratio   = img.width   / img.height

    fill_height = win_height
    fill_width  = win_height * img_ratio

  #   apply_height win_height, img_height

  # apply_height = (win_height, img_height) ->

    img = ".home .content .bg img"
    #bg = document.querySelectorAll bg

    if img_ratio > win_ratio
      $(img).height win_height
      $(img).width 'auto'
      $(img).css left: - (fill_width - win_width) / 2, top: 0
    else
      fill_height  = win_width / img_ratio

      $(img).width win_width
      $(img).height 'auto'
      $(img).css top: - (fill_height - win_height) / 2, left: 0
      #console.log fill_height, win_height

  window.set_size = set_size
  window.addEventListener 'resize', set_size
  set_size()


set_home_height = ->

  $(".inner").css minHeight: $(window).height() - 200


$ ->
  $(".gallery").fancybox()

  images = ".home .content .bg img"
  images = document.querySelectorAll images

  window.cur_img = images[0]

  if images.length > 0
    gal_anim images

    gal_resize()


  # home resize

  set_home_height()
  window.addEventListener 'resize', set_home_height



  # var supersized_slides = [     # Slideshow Images
  #                           {image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-1.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg', url : 'http://www.nonsensesociety.com/2011/04/maria-kazvan/'},
  #                           {image : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/slides/kazvan-2.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-2.jpg', url : 'http://www.nonsensesociety.com/2011/04/maria-kazvan/'},
  #                       ]

  # $.supersized({
  #         # Functionality
  #         slide_interval          :   3000,   # Length between transitions
  #         transition              :   1,      # 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
  #         transition_speed    : 700,    # Speed of transition
  #         # Components
  #         slide_links       : 'blank',  # Individual links for each slide (Options: false, 'number', 'name', 'blank')
  #         slides          :   supersized_slides
  #       })