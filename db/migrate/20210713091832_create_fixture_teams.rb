class CreateFixtureTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :fixture_teams do |t|
      t.integer :fixture_id
      t.integer :team_id
      t.boolean :winner
      t.integer :score

      t.timestamps
    end
  end
end
