class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :course_id
      t.integer :user_id
      t.datetime :date_time
      t.string :status

      t.timestamps
    end
  end
end
