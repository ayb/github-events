module Github
  module Processor

    def self.process(query, page = 1)
      url = Github::UrlBuilder.build(query, page)
      return [] if url.blank?
      response = Typhoeus.get(url)
      return [] unless response.success? && response.body.present?
      filter(response, query)
    end

    def self.filter(response, query)
      Github::Parser.filter(response.body, query.event_type)
    end

  end
end
