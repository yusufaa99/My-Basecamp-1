
class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only, only: %i[index set_admin remove_admin]
  
    def index
      @users = User.all
    end
  
    def set_admin
      user = User.find(params[:id])
      user.update(admin: true)
      redirect_to users_path, notice: "#{user.name} is now an admin."
    end
  
    def remove_admin
      user = User.find(params[:id])
      user.update(admin: false)
      redirect_to users_path, notice: "#{user.name} is no longer an admin."
    end
  
    private
  
    def admin_only
      redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
    end
  end
  