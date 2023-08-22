class AddNotifyTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :notify_time, :time
  end
end
