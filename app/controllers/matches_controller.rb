class MatchesController < ApplicationController

  def show
    users = User.find(params[:user_id])
    @exchange = Exchange.find(params[:id])
    @match = Match.find(parmas[:matches_id])
  end



  def matches_params
    params.require(:match).permit(:gifter, :giftee) if params[:match]
  end
end