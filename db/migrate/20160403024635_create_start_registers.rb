class CreateStartRegisters < ActiveRecord::Migration
  def change
    create_table :start_registers do |t|
      t.string :user_id
      t.text :note

      t.timestamps null: false
    end
    add_index :start_registers, :user_id
  end
end
