# limited to 10 pages per response message here:
# https://api.github.com/repos/rails/rails/events?page=11
module Github
  module UrlBuilder
    MAX_PAGES = 10

    def self.build(query, page = 1)
      raise ArgumentError if !page.is_a?(Integer) || page > MAX_PAGES
      raise ArgumentError unless query.is_a?(Query) && query.owner? && query.repo?
      "https://api.github.com/repos/#{query.owner}/#{query.repo}/events?page=#{page}"
    end

  end
end
