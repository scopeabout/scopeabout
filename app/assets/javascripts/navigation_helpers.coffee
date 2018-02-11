window.redirect_to = (url, originalLocation, delay) ->
  window.setTimeout ( -> window.location.href = url if originalLocation == window.location.href ), delay
