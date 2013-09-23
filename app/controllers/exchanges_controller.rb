class ExchangesController < ApplicationController
  # include Devise::Controllers::InternalHelpers

  # skip_filter :authenticate_inviter!
  # skip_filter :authenticate!

  #the form to create a new exchange
  def new

  end

  #the POST request to process and create a new exchange
  def create
    @exchange = Exchange.new(exchange_params)
    @user = User.find(params[:user_id])
    if @exchange.save && @user.exchanges << @exchange
      flash[:notice] = "Your exchange was created successfully."
    else
      flash[:notice] = "There was a problem creating your to do exchange."
    end
  redirect_to user_exchanges_path
  end

  # the page to edit a exchange's account information
  def edit
    @exchange = Exchange.find(params[:id])
  end

  # The PUT request to update exchange information
  def update
    @exchange = Exchange.find(params[:id])
    if @exchange.update_attributes(exchange_params)
      flash[:notice] = "Your exchange was updated successfully."
    else
      flash[:notice] = "There was a problem updating your exchange."
    end
    redirect_to 'exchange#edit'
  end

  def create_match
    @exchange_users = Exchange.find(params[:id]).users
    if Match.match_users!(@exchange_users)
      flash[:notice] = "Users matched successfully. Gift away!"
    else
      flash[:alert] = "There was a problem matching the users in your exchange. Please try again."
    end
<<<<<<< HEAD
    redirect_to user_exchange_path(user_id: current_user.id)
=======
    redirect_to user_exchange_match
>>>>>>> 013340f95fff0db017dacf5629d15d29462e1b73
  end


  #the method to delete a exchange
  def destroy
    @exchange = Exchange.find(params[:id])
    if @exchange.destroy
      flash[:notice] = "Exchange was destroyed."
    else
      flash[:notice] = "There was a problem destroying the exchange."
    end
    redirect_to 'exchange#index'
  end

  #show an individual exchange
  def show
    users = User.find(params[:user_id])
    @exchange = Exchange.find(params[:id])
    if !@exchange
      redirect_to user_exchanges_path
    end
  end

  #show all the exchanges
  def index
    @user = User.find(params[:user_id])
    if @user
      @exchanges = @user.exchanges
    else
      redirect_to root_path
    end
  end


  private

  def exchange_params
    params.require(:exchange).permit(:exchange_name, :due_date, :price)
  end
end