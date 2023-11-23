class CreatePubScores < ActiveRecord::Migration[7.0]
  def change
    create_table :pub_scores do |t|
      t.integer :score
      t.integer :pub_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
