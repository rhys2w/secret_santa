class HomeController < ApplicationController

  layout 'application'

  def index

  end

  def create_exchange
    @exchange = Exchange.new(exchange_params)
    @user = current_user
    # params.each do |param|
    #   if param[0]["user"]
    @user_1 = User.new(user_1_params)
    @user_1.password = "password"
    @user_1.password_confirmation = "password"
    @user_1.save
    @user_1.exchanges << @exchange
    @user_2 = User.new(user_2_params)
    @user_2.password = "password"
    @user_2.password_confirmation = "password"
    @user_2.save
    @user_2.exchanges << @exchange
    @user_3 = User.new(user_3_params)
    @user_3.password = "password"
    @user_3.password_confirmation = "password"
    @user_3.save
    @user_3.exchanges << @exchange
    @user_4 = User.new(user_4_params)
    @user_4.password = "password"
    @user_4.password_confirmation = "password"
    @user_4.save
    @user_4.exchanges << @exchange
    @user_5 = User.new(user_5_params)
    @user_5.password = "password"
    @user_5.password_confirmation = "password"
    @user_5.save
    @user_5.exchanges << @exchange
    @user_6 = User.new(user_6_params)
    @user_6.password = "password"
    @user_6.password_confirmation = "password"
    @user_6.save
    @user_6.exchanges << @exchange
    @user_7 = User.new(user_7_params)
    @user_7.password = "password"
    @user_7.password_confirmation = "password"
    @user_7.save
    @user_7.exchanges << @exchange
    @user_8 = User.new(user_8_params)
    @user_8.password = "password"
    @user_8.password_confirmation = "password"
    @user_8.save
    @user_8.exchanges << @exchange
    @user_9 = User.new(user_9_params)
    @user_9.password = "password"
    @user_9.password_confirmation = "password"
    @user_9.save
    @user_9.exchanges << @exchange
    @user_10 = User.new(user_10_params)
    @user_10.password = "password"
    @user_10.password_confirmation = "password"
    @user_10.save
    @user_10.exchanges << @exchange
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
  
  def user_1_params
    params.require(:user_1).permit(:email, :password, :first_name, :last_name)
  end
  def user_2_params
    params.require(:user_2).permit(:email, :password, :first_name, :last_name)
  end
  def user_3_params
    params.require(:user_3).permit(:email, :password, :first_name, :last_name)
  end
  def user_4_params
    params.require(:user_4).permit(:email, :password, :first_name, :last_name)
  end
  def user_5_params
    params.require(:user_5).permit(:email, :password, :first_name, :last_name)
  end
  def user_6_params
    params.require(:user_6).permit(:email, :password, :first_name, :last_name)
  end
    def user_7_params
    params.require(:user_7).permit(:email, :password, :first_name, :last_name)
  end
    def user_8_params
    params.require(:user_8).permit(:email, :password, :first_name, :last_name)
  end
    def user_9_params
    params.require(:user_9).permit(:email, :password, :first_name, :last_name)
  end
    def user_10_params
    params.require(:user_10).permit(:email, :password, :first_name, :last_name)
  end
end
