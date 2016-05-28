class User < ActiveRecord::Base
  include Clearance::User

  has_many :shots
  has_many :comment, through: :shots
end
