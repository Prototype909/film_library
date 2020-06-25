class Film < ActiveRecord::Base
  belongs_to :Users
  has_many :reviews
end
