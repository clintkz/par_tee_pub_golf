class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :final_score
      t.string :status

      t.timestamps
    end
  end
end
