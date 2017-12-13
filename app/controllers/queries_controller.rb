class QueriesController < ApplicationController
  helper_method :next_page_link, :more?

  def new
    @query = Query.new
    @events = Github::Event.list
  end

  def create
    @query = Query.new(query_params)
    return @query.save ? process_query : process_invalid
  end

  def process_query
    @events = @query.fetch
    template = @events.present? ? "create" : "none"
    respond_to do |format|
      format.js { render action: template, layout: false }
    end
  end

  def process_invalid
    respond_to do |format|
      format.js { render action: "invalid", layout: false }
    end
  end

  def show

  end

  def next_page_link
    return nil if page_number >= Github::UrlBuilder::MAX_PAGES
    query_path(@query, page: page_number+1)
  end

  def more?
    next_page_link.present?
  end

  private
  def process_query
    @events = @query.fetch
    template = @events.present? ? "create" : "none"
    respond_to do |format|
      format.js { render action: template, layout: false }
    end
  end

  def process_invalid
    respond_to do |format|
      format.js { render action: "invalid", layout: false }
    end
  end

  def page_number
    params[:page].present? ? params[:page].to_i : 1
  end

  def query_params
    params.require(:query).permit(:owner, :repo, :event_type)
  end

end
