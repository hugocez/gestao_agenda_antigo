module SessionsHelper
  
  def sign_in (user)
    
    remember_token = user.id
    cookies[:remember_token] = {value: remember_token, expires: 30.minutes.from_now}
    
    session[:remember_token] = user.id
    
    self.current_user = user
  end
  
  def current_user=(user) 
    @current_user = user
  end
  
  def current_user
    #if session[:remember_token].to_i != 0    
    #  @current_user ||= User.find(session[:remember_token])
    if cookies[:remember_token].to_i != 0
      @current_user ||= User.find(cookies[:remember_token])
    else
      @current_user = nil
    end 
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end 
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil 
  end
  
end
