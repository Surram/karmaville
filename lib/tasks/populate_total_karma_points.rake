require 'faker'

# ActiveRecord::Base.logger = nil

namespace :db do
  desc "Populate the database one at a time"
  task :populate_total_karma_points => :environment do

    User.all.each do |user|
      user_total_kp = 0

      user.karma_points.each do |kp|
        user_total_kp += kp.value
      end

      user.update_attribute(:karma_points_total, user_total_kp)
      # user.save!
    end
  end
end





