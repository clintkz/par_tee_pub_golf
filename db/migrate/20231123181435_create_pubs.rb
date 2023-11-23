class CreatePubs < ActiveRecord::Migration[7.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.integer :course_id
      t.string :drink

      t.timestamps
    end
  end
end
