class AddIndexToUsersOnKpTotal < ActiveRecord::Migration
  def change
    add_index(:users, :karma_points_total)
  end
end
