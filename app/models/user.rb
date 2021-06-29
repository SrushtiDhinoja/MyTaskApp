class User < ApplicationRecord
  has_many :blogs
  has_many :likes
  validates :name , presence: {message: "User name cann't be blank!!!"}
  validates :email, presence: true ,format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  
  validates :password, :presence => true, :confirmation => true, :length => {is: 8}, 
            format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x  }
end
