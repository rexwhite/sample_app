module SessionsHelper

  # Log in given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Return current logged in user
  def current_user
    if session[:user_id]
      @curent_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Is user logged in?
  def logged_in?
    !current_user.nil?
  end

  # Log out current user
  def log_out
    session.delete(:user_id)
    @curent_user = nil
  end
end
