class AddDefaultValueToNotificationAttribute < ActiveRecord::Migration
  def change
    change_column_default :notifications, :read, from: nil, to: false
  end
end
