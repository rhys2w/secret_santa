class HomeController < ApplicationController

  layout 'application'

  def index

  end


  def create_exchange
    @exchange = Exchange.new(exchange_params)
    @user = current_user
    if @exchange.save && @user.exchanges << @exchange
      flash[:notice] = "Your exchange was created successfully."
    else
      flash[:notice] = "There was a problem creating your to do exchange."
    end
    redirect_to exchanges_path
  end

  private

  def exchange_params
    params.require(:exchange).permit(:exchange_name, :due_date, :price)
  end

end
