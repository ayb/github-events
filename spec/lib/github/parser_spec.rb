require 'rails_helper'

RSpec.describe Github::Parser, type: :lib do
  before(:all) do
    @json = file_fixture("rails_events.json").read
    parsed = JSON.parse(@json)
    @size = parsed.size
    @first_event_name = parsed.first["type"]
  end

  it "should return all events when event is nil" do
    expect(Github::Parser.filter(@json, nil).size).to eq(@size)
  end

  it "should return some events when matching the first event name" do
    expect(Github::Parser.filter(@json, @first_event_name).size).to be < @size
  end

  %w(actor type created_at time_ago).each do |field|
    it "should have a hash key matching :#{field}" do
      expect(Github::Parser.filter(@json, @first_event_name).first[field.to_sym]).to be_present
    end
  end

end