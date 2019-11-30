class UserCareer < ApplicationRecord
  belongs_to :user
  belongs_to :career

  after_create :upsert_user_requirements
  after_save :update_user_requirements, if: :saved_change_to_enabled?

  def upsert_user_requirements
    career.requirements.each do |req|
      user_req = UserRequirement.find_or_create_by(user_id: user.id, requirement_id: req.id)

      if user_req.present?
        user_req.enabled = true
        user_req.save!
      end
    end
  end

  def update_user_requirements
    enabled ? upsert_user_requirements : disable_user_requirements
  end

  def disable_user_requirements
    career.requirements.each do |req|
      user_req = UserRequirement.find_by(user_id: user.id, requirement_id: req.id)

      if user_req.present?
        user_req.enabled = false
        user_req.save!
      end
    end
  end
end
