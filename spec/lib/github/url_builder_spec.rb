require 'rails_helper'

RSpec.describe Github::UrlBuilder, type: :lib do
  before(:each) do
    @query = Query.new(owner: "rails", repo: "rails")
    @blank = Query.new
  end

  describe "param requirements" do
    it "should raise error unless first param is a query object" do
      expect { Github::UrlBuilder.build("something") }.to raise_error(ArgumentError)
    end

    it "should require integer page param" do
      expect { Github::UrlBuilder.build(@query, "two") }.to raise_error(ArgumentError)
    end

    it "should require page number of <= 10" do
      expect { Github::UrlBuilder.build(@query, 11) }.to raise_error(ArgumentError)
      expect { Github::UrlBuilder.build(@query, 9) }.to_not raise_error
    end

    it "should require query repo owner" do
      @blank.repo = "rails"
      expect { Github::UrlBuilder.build(@blank) }.to raise_error(ArgumentError)
    end

    it "should require query repo name" do
      @blank.owner = "rails"
      expect { Github::UrlBuilder.build(@blank) }.to raise_error(ArgumentError)
    end
  end

  it "should generate expected URL" do
    expect { Github::UrlBuilder.build(@query, 9) }.to_not raise_error
    expect(Github::UrlBuilder.build(@query, 9)).to be
      "https://api.github.com/repos/rails/rails/events?page=9"
  end

end
