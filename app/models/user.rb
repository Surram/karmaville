class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
    order('karma_points_total DESC')
  end

  def total_karma
    # self.karma_points.sum(:value)
    karma_points_total
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(page_number = nil)
    page_number = 1 if page_number.nil?
    num = ((page_number - 1) * 50) + 1
    User.by_karma.limit(50).offset(num)
  end

end
