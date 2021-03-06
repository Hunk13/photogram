class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by, index: true
      t.references :post, index: true, foreign_key: true
      t.integer :identifier
      t.string :notice_type
      t.boolean :read

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
