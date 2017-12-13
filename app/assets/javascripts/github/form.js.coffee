Github.Form =

  initialize: ->
    $("input").on 'keyup', ->
      $("#results").html("")
