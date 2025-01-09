class AddAttributesToNotifications < ActiveRecord::Migration[8.0]
  def change
    add_column :notifications, :read_status, :boolean
    add_column :notifications, :user_id, :integer
  end
end
