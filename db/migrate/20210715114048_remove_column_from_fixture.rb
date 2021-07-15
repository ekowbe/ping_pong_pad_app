class RemoveColumnFromFixture < ActiveRecord::Migration[6.1]
  def change
    remove_column :fixtures, :date, :date
    remove_column :fixtures, :time, :time
  end
end
