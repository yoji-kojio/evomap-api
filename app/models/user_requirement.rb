class UserRequirement < ApplicationRecord
  belongs_to :user
  belongs_to :requirement
  after_create :set_user_requirements_name

  scope :finished, -> { where(finished: true) }

  def set_user_requirements_name
    requirement = Requirement.find(self.requirement_id)
    self.requirement_name = requirement.name
    self.save!
  end
end
