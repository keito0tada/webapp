class SessionsController < ApplicationController
  def new
    user = current_user
    return unless user

    redirect_to user_url(user), status: :moved_permanently
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user&.authenticate(session_params[:password])
      reset_session
      @login_session = Session.new_login_session(user)
      if @login_session.save
        log_in(user, @login_session)
        redirect_to user_url(user), status: :moved_permanently
      else
        render 'sessions/new', status: :unprocessable_entity
      end
    else
      flash[:danger] = 'Invalid'
      render 'sessions/new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    @login_session.destroy
    redirect_to root_url, status: :see_other
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
