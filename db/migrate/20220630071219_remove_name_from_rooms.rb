class RemoveNameFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :name, :string
  end
end
