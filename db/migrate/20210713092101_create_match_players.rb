class CreateMatchPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :match_players do |t|
      t.integer :player_id
      t.integer :match_id
      t.boolean :winner

      t.timestamps
    end
  end
end
