class AddDateTimeToFixtures < ActiveRecord::Migration[6.1]
  def change
    add_column :fixtures, :date_time, :datetime
  end
end
