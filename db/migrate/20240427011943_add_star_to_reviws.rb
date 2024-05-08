class AddStarToReviws < ActiveRecord::Migration[6.1]
  def change
    add_column :reviws, :star, :float
  end
end
