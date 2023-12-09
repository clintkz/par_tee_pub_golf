class AddChatroomToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :game, null: false, foreign_key: true
  end
end
