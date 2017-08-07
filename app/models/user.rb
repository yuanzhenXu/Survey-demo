class User < ApplicationRecord
  has_many :useranswers
  has_secure_password
end
