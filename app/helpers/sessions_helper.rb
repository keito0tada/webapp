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
    elsif cookies.encrypted[:user_id] && cookies[:session_token]
      user_id = cookies.encrypted[:user_id]
      session_token = cookies[:session_token]
      user = User.find_by(id: user_id)
      login_session = Session.get_session(user_id, session_token)
      if user && login_session
        reset_session
        login_session.destroy
        login_session = Session.new_login_session(user)
        if login_session.save
          log_in(user, login_session)
          return true
        else
          delete_session_cookies
        end
      else
        delete_session_cookies
      end
    else
      delete_session_cookies
    end

    false
  end

  def current_session
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

  def delete_session_cookies
    cookies.delete(:user_id)
    cookies.delete(:session_token)
  end
end
