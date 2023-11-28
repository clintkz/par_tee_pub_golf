class AddParticipantReferenceToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :participant, foreign_key: true
  end
end
