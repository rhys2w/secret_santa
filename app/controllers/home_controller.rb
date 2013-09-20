class HomeController < ApplicationController

  layout 'application'

  def index

  end

  def create_exchange
    #handle the exchange's users that are added "user_one" "user_two" etc.
    @exchange = Exchange.new(exchange_params)
    @user = current_user
    @user_one = User.new(user_one_params)
    @user.save
    @user_one.exchanges << @exchange
    if @exchange.save && @user.exchanges << @exchange
      flash[:notice] = "Your exchange was created successfully."
    else
      flash[:notice] = "There was a problem creating your to do exchange."
    end
    redirect_to user_exchanges_path(user_id: current_user.id)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:exchange_name, :due_date, :price)
  end
  def user_one_params
    params.require(:user_one).permit(:first_name, :last_name, :email)
  end


end
