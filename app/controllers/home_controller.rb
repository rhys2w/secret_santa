class HomeController < ApplicationController

  layout 'application'

  def index

  end

  def create_exchange
    @exchange = Exchange.new(exchange_params)
    @user = current_user
    @user_one = User.new(user_one_params)
    @user_one.password = "testtestest"
    @user_one.password_confirmation = "testtestest"
    @user_one.save
    @user_one.exchanges << @exchange
    if @exchange.save && @user.exchanges << @exchange
      flash[:notice] = "Your exchange was created successfully."
    else
      flash[:notice] = "There was a problem creating your to do exchange."
    end
    redirect_to user_exchanges_path(user_id: current_user.id)
  end

  def update_exchange
    @exchange = Exchange.find(session[:id])
    if @exchange.update_attributes(user_params) #<- this is what needs to be changed => @exchange & user_params
      flash[:notice] = "Your exchange was updated successfully."
    else
      flash[:notice] = "There was a problem updating your exchange."
    end
    redirect_to user_exchange_path(user_id: current_user.id, id: current_exchange.id)
  end

  private

  def exchange_params
    params.require(:exchange).permit(:exchange_name, :due_date, :price)
  end
  def user_one_params
    params.require(:user_one).permit(:email, :password, :first_name, :last_name)
  end
end
