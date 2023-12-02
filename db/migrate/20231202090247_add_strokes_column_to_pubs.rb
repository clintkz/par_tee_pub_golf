class AddStrokesColumnToPubs < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :strokes, :integer
  end
end
