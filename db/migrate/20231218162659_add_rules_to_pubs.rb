class AddRulesToPubs < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :rules, :text
  end
end
