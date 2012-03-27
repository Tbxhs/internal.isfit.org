class ContactLogPerson < ActiveRecord::Base
  belongs_to :contact_log_unit
  has_many :contact_logs
  # Return full name of user
  def full_name
    "#{first_name} #{last_name}"
  end

end
