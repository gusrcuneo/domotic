class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :room
      t.string :type
      t.string :name
      t.text :description
      t.integer :status

      t.timestamps
    end
    add_index :devices, :room_id
  end
end
