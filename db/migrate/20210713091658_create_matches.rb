class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :fixture_id
      t.string :name

      t.timestamps
    end
  end
end
