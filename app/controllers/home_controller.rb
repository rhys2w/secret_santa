class HomeController < ApplicationController

  layout 'application'

  def index

  end


  def create_exchange
    @exchange = params
    puts params[:user_one].inspect

  end


end
