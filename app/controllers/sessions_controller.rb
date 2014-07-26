class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    render 'new'
    
    user = User.find_by(email: params[:sessions][:email].downcase)
    
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Usuário/Senha Inválidos'
      render 'new'
    end
  end
  
  def destroy
    
  end
  
end
