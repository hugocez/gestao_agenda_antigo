class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    
    user = User.find_by(user_name: params[:session][:user_name].downcase)
    
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Usuario/Senha Invalidos'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
