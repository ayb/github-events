Github.Response =

  emptyRow: "<tr><td>No results found</td></tr>"

  headerRow: "<tr><th>Who</th><th>What</th><th>When</th></tr>"

  none: ->
    $("#load-more-with-jquery").remove()
    $("#results").append(Github.Response.emptyRow)

  renderHeader: ->
    $("#results").html(G)

  rowHtml: (row) ->
    html = "<tr class=\"event\">"
    html += "<td class=\"avatar\">"
    html += "<img src=\"" + row.actor.avatar_url + "\"><br/>"
    html += "<a href=\"https://github.com/" + row.actor.login + "\" target=\"_blank\">"
    html += row.actor.display_login + "</a>"
    html += "</td>"
    html += "<td>" + row.type + "</td>"
    html += "<td>" + row.created_at + "<br/>"
    html += "(about " + $.timeago(row.created_at) + ")"
    html += "</td></tr>"
    return html

  render: (data) ->
    area = $("#results")
    html = Github.Response.headerRow
    rows = 0
    $.each data, (index, row) ->
      unless Github.Response.shouldFilter(row)
        html += Github.Response.rowHtml(row)
        rows += 1
    if rows > 0
      area.html(html)
    else
      Github.Response.none()

  shouldFilter: (data) ->
    filter = $("#query_event_type").val()
    return false unless (filter)
    return (data.type != filter)


