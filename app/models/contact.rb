class Contact < ActiveRecord::Base
  has_many :communications
  belongs_to :user

  validates_presence_of :contact_name
  validates_uniqueness_of :contact_name

  def last_communication
    "2 days ago"
  end
end
