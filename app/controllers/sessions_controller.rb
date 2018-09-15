class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if !user
      flash[:error] = "Email not found. Please try again."
      render :new
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to index_path
    else
      flash[:error] = "Invalid password. Please try again."
      render :new
    end
  end

  def destroy
  end
end
