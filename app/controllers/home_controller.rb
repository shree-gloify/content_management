class HomeController < ApplicationController

  def show
    render json: {:message => "Welcome to Sample API."}
  end

  def search
  	@results = PgSearch.multisearch(params[:query])
  	render json: @results, each_serializer: SearchSerializer
  end
  
end
