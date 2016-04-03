class CreateSuperWhiteDomainNames < ActiveRecord::Migration
  def change
    create_table :super_white_domain_names do |t|
      t.string :domain_name

      t.timestamps null: false
    end
    add_index :super_white_domain_names, :domain_name, unique: true
  end
end
