class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    # if there is a user_id in the session hash, find that user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # return true if there is a current user, false otherwise
    !!current_user
  end

end
