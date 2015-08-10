class CreateBlackDomainNames < ActiveRecord::Migration
  def change
    create_table :black_domain_names do |t|
      t.string :domain_name

      t.timestamps null: false
    end
    add_index :black_domain_names, :domain_name, unique: true
  end
end
