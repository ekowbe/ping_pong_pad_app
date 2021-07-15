class RemoveColumnFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :college, :string
  end
end
