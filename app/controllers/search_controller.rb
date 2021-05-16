class SearchController < ApplicationController
  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
	  @records = Event.search_for(@content, @method)
  end
end
