# app/controllers/dashboards_controller.rb
class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def user
    # You can add any user-specific data here if needed
  end
end
