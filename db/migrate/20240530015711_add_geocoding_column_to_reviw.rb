class AddGeocodingColumnToReviw < ActiveRecord::Migration[6.1]
   def change
    add_column :reviws, :address, :string, null: false, default: ""
    add_column :reviws, :latitude, :float, null: false, default: 0
    add_column :reviws, :longitude, :float, null: false, default: 0
   end
end
