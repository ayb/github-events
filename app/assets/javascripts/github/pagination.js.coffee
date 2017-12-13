Github.Pagination =

  loading: false

  lastResultCount: 0

  pageNumber: 1

  # has more if on page 1, or if on subsequent page and we still have results
  hasMore: ->
    return true if Github.Pagination.nextPageNumber == 1
    (Github.Pagination.pageNumber < 10) && (Github.Pagination.lastResultCount > 0)

  withjQuery: ->
    Github.Pagination.loading = false

    $("#load-more-with-jquery").on 'inview', (event, visible) ->
      return if Github.Pagination.loading or not visible
      Github.Pagination.loading = true
      Github.Queries.fetchWithjQuery()
      Github.Pagination.loading = false

    $("#load-more-with-jquery").on 'click', ->
      Github.Pagination.loading = true
      Github.Queries.fetchWithjQuery()
      Github.Pagination.loading = false

  withRails: ->
    Github.Pagination.loading = false
    $("#load-more-from-rails").on 'inview', (event, visible) ->
      return if Github.Pagination.loading or not visible
      Github.Pagination.loading = true
      url = $(this).find('a').prop('href')
      $.getScript url, ->
        Github.Pagination.loading = false

  reset: ->
    Github.Pagination.lastResultCount = 0
    Github.Pagination.pageNumber = 1
    Github.Pagination.loading = false
