class Requirement < ApplicationRecord
  has_many :user_requirements
  has_many :users, through: :user_requirements
  has_many :career_requirements
  has_many :careers, through: :career_requirements
  has_many :requirement_contents
  has_many :contents, through: :requirement_contents
end
