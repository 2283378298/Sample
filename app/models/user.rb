class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password
  EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :name, presence: true, length: {maximum: 10}
  validates :email, presence: true,length: {maximum: 10}, format: { with: EMAIL } ,uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6}
end
