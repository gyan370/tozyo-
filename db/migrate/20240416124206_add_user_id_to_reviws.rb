class AddUserIdToReviws < ActiveRecord::Migration[6.1]
  def change
    add_column :reviws, :user_id, :integer
  end
end
