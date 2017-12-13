Github.Form =

  allowedEventTypes: ->
    $("#query_event_type").data("list").split(", ")

  removeErrors: ->
    $(".error").removeClass("error")

  validEventType: ->
    field = $("#query_event_type")
    input = field.val()
    return true unless (input)
    if Github.Form.allowedEventTypes().includes(input)
      return true
    else
      field.addClass("error")
      return false

  validFields: ->
    blanks = 0
    $.each $("input.not-empty"), (index, field) ->
      unless ($(field).val())
        blanks += 1
        $(field).addClass("error")
    return (blanks == 0)

  validInputs: ->
    errors = 0
    errors += 1 unless Github.Form.validFields()
    errors += 1 unless Github.Form.validEventType()
    return (errors == 0)

  initialize: ->
    $("input").on 'keyup', ->
      $("#results").html("")
      Github.Form.removeErrors()
