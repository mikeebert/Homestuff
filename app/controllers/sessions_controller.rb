class SessionsController < ApplicationController


  def index
    @user = User.new
  end
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to items_url, :notice => "You are now logged in."
    else
      redirect_to new_sessions_url, :notice => "Sorry, try again."
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => "You have successfully logged out."
  end

end
