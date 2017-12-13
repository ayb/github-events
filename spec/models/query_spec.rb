require 'rails_helper'

RSpec.describe Query, type: :model do
  it { should validate_presence_of :owner }
  it { should validate_presence_of :repo }

  describe "event type" do
    before(:each) do
      @query = Query.new(owner: "rails", repo: "rails")
    end

    it "should allow blank event type" do
      expect(@query.event_type).to be_nil
      expect(@query).to be_valid
    end

    it "should allow valid event such as ForkEvent" do
      @query.event_type = "ForkEvent"
      expect(@query).to be_valid
    end

    it "should not allow invalid events" do
      @query.event_type = "xyz"
      expect(@query).to be_invalid
    end

  end
end
