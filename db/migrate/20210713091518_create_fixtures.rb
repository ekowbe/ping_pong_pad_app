class CreateFixtures < ActiveRecord::Migration[6.1]
  def change
    create_table :fixtures do |t|
      t.boolean :completed
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
