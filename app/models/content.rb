class Content < ApplicationRecord
  has_many :requirement_contents
  has_many :requirements, through: :requirement_contents
end
