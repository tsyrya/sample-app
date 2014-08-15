class SessionsController < ApplicationController

  def new
  end

  
   def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
      flash[:success] = "Welcome to the Sample App!"
    else
      flash.now[:danger] = "Неверный логин/пароль"
      render 'new'
    end
  end

  def delete
  end

  def destroy
    sign_out
    redirect_to root_url
  end


end
