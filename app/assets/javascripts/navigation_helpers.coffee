window.redirect_to = (url, delay) ->
  window.setTimeout ( -> window.location.href = url ), delay
