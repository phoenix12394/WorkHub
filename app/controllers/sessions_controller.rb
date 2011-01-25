class SessionsController < ApplicationController
  def new
    @title = "sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "invalid email/pw"
      @title = "sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
    
  end

def createauto
  auth = request.env["omniauth.auth"]
  if (auth['provider'] == "facebook")
  user = User.find_by_email(auth['extra']['user_hash']["email"]) || User.create_with_omniauth(auth)
else
    user = User.find_by_email(auth['user_info']["email"]) || User.create_with_omniauth(auth)
    
  end
  sign_in user
  redirect_back_or user
end
  
  def destroy
    sign_out
    redirect_to root_path
  end
end
