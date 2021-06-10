class SearchController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @records = Event.search_for(@content)
  end
end

