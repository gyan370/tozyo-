class CreateReviwComments < ActiveRecord::Migration[6.1]
  def change
    create_table :reviw_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :reviw_id

      t.timestamps
    end
  end
end
