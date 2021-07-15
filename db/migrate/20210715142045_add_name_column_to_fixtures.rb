class AddNameColumnToFixtures < ActiveRecord::Migration[6.1]
  def change
    add_column :fixtures, :name, :string
  end
end
