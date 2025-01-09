# class Admin::DashboardController < ApplicationController
# end
class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin!
  
    def index
      @users = User.all
      @projects = Project.all
    end
  end
  