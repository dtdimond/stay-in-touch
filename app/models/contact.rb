class Contact < ActiveRecord::Base
  has_many :communications
  belongs_to :user
end
