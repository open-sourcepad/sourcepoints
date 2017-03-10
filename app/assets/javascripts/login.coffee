$(document).ready ->
  $('#login-devise').hide()
  setTimeout (->
    $('.login-bg').fadeOut('slow', ->
      $('.login-bg').css('background-image', 'url(/assets/2nd-login.png)')
      $('.login-bg').fadeIn('slow')
      $('#login-devise').show()
      )
    ), 2000
  return
