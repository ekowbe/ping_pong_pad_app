class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :name
      t.integer :fixture_id

      t.timestamps
    end
  end
end
