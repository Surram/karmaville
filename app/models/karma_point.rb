class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  before_save :update_users_karma_points

  def update_users_karma_points
    user = User.find(user_id)

    total_karma_points = user.karma_points_total + value

    user.update_attributes(:karma_points_total => total_karma_points)
    user.save!
  end
end
