class AddCoordinatesToPubs < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :latitude, :float
    add_column :pubs, :longitude, :float
  end
end
