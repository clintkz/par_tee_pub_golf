class AddImageToPubs < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :image, :string
  end
end
