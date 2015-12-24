class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def service_connection
    @service_connection ||= TwitterService.new(current_user)
  end

  def sheep_text(tweet)
    baa_text = tweet.text.split(/\W+/).map!.with_index do |word, index|
      if index % 4 == 0
        word = "baa"
      elsif index % 4 == 2
        word = "sheep"
      elsif word[0..3] == "http"
        word = ""
      else
        word
      end
    end
    baa_text.join(" ")
  end

  helper_method :current_user, :service_connection, :sheep_text
end
