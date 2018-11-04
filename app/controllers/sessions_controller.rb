class SessionsController < ApplicationController

  def new

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Signed Out!"
    redirect_to '/'
  end

end
