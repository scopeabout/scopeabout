# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(->
  joinForFreeClickHandler = ->
    return if document.querySelector('.join-us-for-free') == null

    document.querySelector('.join-us-for-free').onclick = ->
      document.querySelector('.subscribe-form').scrollIntoView({
        behavior: 'smooth'
      })

  $(document).on 'ready', joinForFreeClickHandler
  $(document).on 'turbolinks:load', joinForFreeClickHandler
)()