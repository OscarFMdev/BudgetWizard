class UsersController < ApplicationController
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: 'User was successfully deleted.'
  end

  private

  def require_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'You must be an admin to access this page.'
  end
end
