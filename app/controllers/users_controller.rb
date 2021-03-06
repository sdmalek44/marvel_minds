class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:notice] = 'Successfully Created Account!'
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = 'Username Invalid or Already Exists!'
      render :new
    end
  end

  private

  def user_params
    params.permit(:password, :username)
  end
end
