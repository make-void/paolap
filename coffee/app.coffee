console.log "hello coffee!"

qs = document.querySelector

window.cur_idx = 0

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
    #console.log(elements[next_idx])
    #console.log "hiding #{cur_idx}, showing #{next_idx}"
    window.cur_idx = if cond then 0 else cur_idx + 1

    gal_anim elements
  , time

gal_resize = ->


  set_size = ->
    bg = ".home .content .bg"
    bg = document.querySelector bg
    images = ".home .content .bg img"
    images = document.querySelectorAll images
    console.log "resize"
    bg.style.height = images[0].height
    console.log bg.style.height
    console.log images[0].height

  window.addEventListener 'resize', set_size

  set_size()

$ ->
  $(".gallery").fancybox()

  images = ".home .content .bg img"
  images = document.querySelectorAll images
  gal_anim images

  gal_resize()