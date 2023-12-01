class AddArrivedToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :arrived, :boolean
  end
end
