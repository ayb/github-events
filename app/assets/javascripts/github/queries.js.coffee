Github.Queries =

  buildQueryUrl: (page) ->
    url = "https://api.github.com/repos/"
    url += $("#query_owner").val() + "/"
    url += $("#query_repo").val() + "/events"
    url += "?page=" + page
    url

  fetchWithjQuery: ->
    $.ajax
      url: Github.Queries.buildQueryUrl(Github.Pagination.pageNumber)
      dataType: 'json'
      success: (data) ->
        if data.length > 0
          Github.Response.render(data)
        else
          Github.Response.none()

  initialize: ->
    $("#query-with-jquery").on 'click', ->
      return false unless Github.Form.validInputs()
      Github.Queries.fetchWithjQuery()
      return false