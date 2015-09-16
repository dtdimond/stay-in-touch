class User < ActiveRecord::Base
  has_many :contacts
  has_many :communications

  has_secure_password validations: false, unique: true

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 4}
end
