class CreateDomainUpdateLogs < ActiveRecord::Migration
  def change
    create_table :domain_update_logs do |t|
      t.integer :type
      t.string :domain_name

      t.timestamps null: false
    end
  end
end
