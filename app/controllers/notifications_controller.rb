# class NotificationsController < ApplicationController
#     def index
#         @notifications = Notification.all # Adjust based on your notification logic
#     end

#     before_action :authenticate_user!
#     before_action :ensure_admin!
  
#     # def index
#     #   @notifications = Notification.all # Adjust based on your notification logic
#     # end
#     def new
#       @notification = Notification.new
#     end
  
#     def create
#       @notification = Notification.new(notification_params)
#       @notification.read_status = false # Default unread
#       if @notification.save
#         redirect_to notifications_path, notice: 'Notification created successfully!'
#       else
#         render :new, status: :unprocessable_entity
#       end
#     end
  
#     private
  
#     def notification_params
#       params.require(:notification).permit(:title, :message, :user_id)
#     end
  
#     def ensure_admin!
#       unless current_user.admin?
#         redirect_to root_path, alert: 'You are not authorized to perform this action.'
#       end
#     end
#   end
class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: [:index, :show]
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # For all users
  def index
    @notifications = Notification.all.order(created_at: :desc)
  end

  # def show; end
  def show
    @notification = Notification.find(params[:id])
  end
  
  # Admin-only actions
  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.read_status = false # Default unread
    if @notification.save
      redirect_to notifications_path, notice: 'Notification created successfully!'
    else
      render :new
    end
  end

  # def edit; end
  def edit
    # This action sets @notification for editing
  end

  # def update
  #   if @notification.update(notification_params)
  #     redirect_to notifications_path, notice: 'Notification updated successfully!'
  #   else
  #     render :edit
  #   end
  # end
  def update
    if @notification.update(notification_params)
      redirect_to notifications_path, notice: 'Notification updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @notification.destroy
    redirect_to notifications_path, notice: 'Notification deleted successfully!'
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def admin_only
    redirect_to notifications_path, alert: 'Access denied!' unless current_user.admin?
  end

  def notification_params
    params.require(:notification).permit(:title, :message, :read_status, :user_id)
  end
end
