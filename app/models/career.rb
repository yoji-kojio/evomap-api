class Career < ApplicationRecord
  has_many :user_careers
  has_many :users, through: :user_careers
  has_many :career_requirements
  has_many :requirements, through: :career_requirements
end
