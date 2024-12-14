class SessionsController < ApplicationController
  def new; end

  def create
    reset_session
    user = User.find_or_create_by(id: params[:id])
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
