class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :location
      t.integer :number_of_pubs

      t.timestamps
    end
  end
end
