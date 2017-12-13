# Query/Filter Github Events API via Rails or jQuery

### This app:
- lets you choose a repo owner, repo name, and an (optional) event name
- will query the Github Events API to fetch latest event stream
- has pagination features through 10 pages (max data we can fetch via API)
- implemented via both Rails (fetching via Typhoeus) or from jQuery direct to Github's API
- rSpec tests for Query model and (most of) the Github processing lib

### Demo
![demo](https://d1ax1i5f2y3x71.cloudfront.net/items/1w231h2L3K1L3w0x2U1e/Screen%20Recording%202017-12-13%20at%2011.27%20AM.gif)

### Uses:
- Ruby 2.4.2
- Rails 5.1.4
- Postgresql
- Typhoeus
- HAML
- jQuery
- Awesomplete.js
- jQuery.inview.js
- jQuery.timeago.js

### Before starting:
- run migrations to create tables

### Copyright

Copyright (c) 2017 by Alexander Barbara. Released under MIT license.

All libraries used and contained within have their own respective copyrights and licenses.

