class AddDefaultValueToNotificationAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column_default :notifications, :read, from: nil, to: false
  end
end
