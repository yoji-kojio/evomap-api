class UserRequirement < ApplicationRecord
  belongs_to :user
  belongs_to :requirement
end
