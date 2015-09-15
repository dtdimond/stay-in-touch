class User < ActiveRecord::Base
  has_many :contacts
  has_many :communications

end
