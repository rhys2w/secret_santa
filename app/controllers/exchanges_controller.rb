class ExchangesController < ApplicationController

  #the form to create a new exchange
  def new

  end

  #the POST request to process and create a new exchange
  def create
    @exchange = Exchange.new(exchange_params)
    # @user = User.find(params[:user_id])
    # if @exchange.save && @user.exchanges << @exchange
    #   flash[:notice] = "Your to do exchange was created successfully."
    # else
    #   flash[:notice] = "There was a problem creating your to do exchange."
    # end
    redirect_to 'exchange#index'
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
    @exchange = Exchange.find(params[:id])
  end

  #show all the exchanges
  def index
    @exchanges = Exchange.all
  end


  private

  def exchange_params
    params.require(:exchange).permit(:exchange_name, :due_date, :price)
  end




end