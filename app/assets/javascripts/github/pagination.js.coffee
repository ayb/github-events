Github.Pagination =

  loading: false

  pageNumber: 1

  withRails: ->
    Github.Pagination.loading = false
    $("#load-more-from-rails").on 'inview', (event, visible) ->
      return if Github.Pagination.loading or not visible
      Github.Pagination.loading = true
      url = $(this).find('a').prop('href')
      $.getScript url, ->
        Github.Pagination.loading = false