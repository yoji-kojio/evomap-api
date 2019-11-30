class RemoveCareerFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :career
  end
end
