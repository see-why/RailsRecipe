class UsersController < ApplicationController
  before_action :authenticate_user!
  def index; end

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end
end
