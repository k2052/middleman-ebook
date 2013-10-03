#= require "jquery/jquery"
#= require "coffee-script"
#= require "chai/chai"
#= require "mocha/mocha"
#= require "codemirror/lib/codemirror"
#= require "codemirror/mode/coffeescript/coffeescript"
#= require "codemirror/mode/javascript/javascript"
#= require "executr"

$(document).ready ->
  $('body').executr
    codeSelector: 'code.executable'
    codeMirrorOptions: 
      theme: "github"

  $toc = $('.toc')
  $('.toc-toggle').click ->
    if $toc.hasClass('open')
      $toc.removeClass('open')
    else
      $toc.addClass('open')

  $(".section-title").click ->
    $(".section-title").removeClass('active')
    $(this).addClass('active')

  if location.hash != ""
    section_title =  location.hash.slice(1)
    section_title = "." + section_title
    $(section_title).addClass("active")
