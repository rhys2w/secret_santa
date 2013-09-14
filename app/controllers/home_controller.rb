class HomeController < ApplicationController

  layout 'application'

  def index

  end


  def create_exchange
    puts params[:user_one].inspect

  end
  

end
