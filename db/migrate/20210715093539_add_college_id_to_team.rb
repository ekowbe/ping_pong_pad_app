class AddCollegeIdToTeam < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :college_id, :integer
  end
end
