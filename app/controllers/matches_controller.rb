class MatchesController < ApplicationController

  def create_match
    @exchange_users = Exchange.find(params[:id]).users
    if Match.match_users!(@exchange_users)
      flash[:notice] = "Users matched successfully. Gift away!"
    else
      flash[:alert] = "There was a problem matching the users in your exchange. Please try again."
    end
    redirect_to user_exchange_match
  end

  def show
    users = User.find(params[:user_id])
    @exchange = Exchange.find(params[:id])
    @match = Match.find(parmas[:matches_id])
  end



  def matches_params
    params.require(:match).permit(:gifter, :giftee) if params[:match]
  end
end