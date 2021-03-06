class Kvitter < ActiveRecord::Base
  belongs_to :user

  has_many :awesomes

  validates :message, :presence => true
  
  self.per_page = 10

  def username
    self.user.username
  end

  def awesome_count
  	self.awesomes.count
  end

  def user_full_name
    self.user.given_name + " " + self.user.family_name
  end
end
