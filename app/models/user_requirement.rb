class UserRequirement < ApplicationRecord
  belongs_to :user
  belongs_to :requirement

  scope :finished, -> { where(finished: true) }
end
