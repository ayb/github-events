require 'rails_helper'

RSpec.describe Github::Event, type: :lib do
  it "should have event types" do
    expect(Github::Event::TYPES).to be_present
    expect(Github::Event::TYPES.is_a?(Array)).to be true
  end

  describe "validations" do
    it "should check validity of events" do
      expect(Github::Event.respond_to?(:valid?)).to be true
    end

    it "should know ForkEvent is valid" do
      expect(Github::Event.valid?("ForkEvent")).to be true
    end

    it "should identify incorrect events" do
      expect(Github::Event.valid?("xyz")).to be false
    end
  end

  it "should join list of events" do
    expect(Github::Event.list).to eq(Github::Event::TYPES.join(", "))
  end
end
