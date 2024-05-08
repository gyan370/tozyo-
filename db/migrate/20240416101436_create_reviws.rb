class CreateReviws < ActiveRecord::Migration[6.1]
  def change
    create_table :reviws do |t|
      t.string :title
      t.text :introduction
      t.string :castle
      t.string :store
      
      t.timestamps
    end
  end
end
