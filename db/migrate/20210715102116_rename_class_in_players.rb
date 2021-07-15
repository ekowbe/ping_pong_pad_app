class RenameClassInPlayers < ActiveRecord::Migration[6.1]
  def change
    rename_column :players, :class, :class_of
  end
end
