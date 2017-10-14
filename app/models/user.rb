class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
validates :email,:fname, :lname, presence: true
  # validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true , format: { with: EMAIL_REGEX }
end
