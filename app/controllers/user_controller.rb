    class UserController < ApplicationController

  #the form to create a new user
  def new

  end

  #the POST request to process and create a new user
  def create
    @user = params[:user] ? User.new(params[:user]) : User.new_guest
    if @user.save
      flash[:notice] = "Your account was created successfully."
      current.user.move_to(@user) if current.user && current.user.guest?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render "new"
      flash[:notice] = "There was a problem creating your account."
    end
    
  end

  # the page to edit a user's account information
  def edit
    @user = User.find(params[:id])
  end

  # The PUT request to update user information
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Your account was updated successfully."
    else
      flash[:notice] = "There was a problem updating your account."
    end
    redirect_to user_path(@user)
  end

  #the method to delete a user
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User was destroyed."
    else
      flash[:notice] = "There was a problem destroying the user."
    end
    redirect_to user_index_path
  end

  #show an individual user
  def show
    @user = User.find(params[:id])
  end

  #show all the users
  def index
    @users = User.all
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end



end