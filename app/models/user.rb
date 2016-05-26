class User < ActiveRecord::Base
  has_many :shots
  has_many :comment, through: :shots
end
