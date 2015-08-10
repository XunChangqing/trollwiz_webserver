class CreateWhiteDomainNames < ActiveRecord::Migration
  def change
    create_table :white_domain_names do |t|
      t.string :domain_name

      t.timestamps null: false
    end
    add_index :white_domain_names, :domain_name, unique: true
  end
end
