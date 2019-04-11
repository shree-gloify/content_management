class HomeController < ApplicationController

  def show
    render json: {:message => "Welcome to Dalstan API."}
  end
  
end
