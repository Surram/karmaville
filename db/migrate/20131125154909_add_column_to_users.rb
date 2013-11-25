class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :karma_points_total, :integer, default: 0
  end
end
