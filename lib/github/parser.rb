module Github
  module Parser

    KEEP = %w(actor type created_at)

    def self.filter(json, event)
      JSON.parse(json).map {
        |rec| to_row(rec) if matches?(rec, event)
      }.compact
    end

    private
    def self.matches?(record, event)
      return true if event.blank?
      return false if record.blank?
      record["type"].eql?(event)
    end

    def self.exclude(record)
      record.keys - KEEP
    end

    def self.time_ago(timestamp)
      "(#{ApplicationController.helpers.time_ago_in_words(DateTime.strptime(timestamp))} ago)"
    end

    def self.to_row(record)
      record.except(*exclude(record)).deep_symbolize_keys.
        merge(time_ago: time_ago(record["created_at"]))
    end

  end
end
