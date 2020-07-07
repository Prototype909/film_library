class User < ActiveRecord::Base
  has_secure_password #give you writer for authenticate. give buildin password vaildation. gives confirmtion field
  has_many :films
end
