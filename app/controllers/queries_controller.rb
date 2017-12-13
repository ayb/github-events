class QueriesController < ApplicationController

  def new
    @query = Query.new
    @events = Github::Event.list
  end

  def create

  end

  def show

  end

end
