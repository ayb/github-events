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
        Github.Pagination.lastResultCount = data.length
        if data.length > 0
          if Github.Pagination.pageNumber > 1
            Github.Response.append(data)
          else
            Github.Response.render(data)
          Github.Pagination.pageNumber += 1
        else
          Github.Response.none()

  initialize: ->
    $("#query-with-jquery").on 'click', ->
      return false unless Github.Form.validInputs()
      Github.Pagination.reset()
      Github.Queries.fetchWithjQuery()
      return false