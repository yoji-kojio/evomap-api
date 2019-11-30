class User < ApplicationRecord
  has_many :user_careers
  has_many :careers, through: :user_careers
  has_many :user_requirements
  has_many :requirements, through: :user_requirements
end
