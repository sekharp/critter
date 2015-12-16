class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      # save everything you get back
      # check for duplication
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:logout] = "Goodbye!"
    redirect_to root_path
  end
end
