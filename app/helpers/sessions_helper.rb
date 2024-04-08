# frozen_string_literal: true

module SessionsHelper
  def log_in(user, login_session)
    session[:user_id] = user.id
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:session_token] = login_session.session_token
  end

  def logged_in?
    if session[:user_id]
      return true
    elsif cookies.encrypted[:user_id] && coockies[:session_token]
      user_id = cookies.encrypted[:user_id]
      session_token = cookies[:session_token]
      login_session = Session.find_by(user_id:, session_digest: Session.digest(session_token))
      return true if login_session

      false
    end

    false
  end

  def current_user_id
    return session[:user_id] if logged_in?

    nil
  end

  def current_user
    user_id = current_user_id
    return User.find(user_id) if user_id

    nil
  end

  def log_out
    cookies.delete(:user_id)
    cookies.delete(:session_token)
    reset_session
  end
end
