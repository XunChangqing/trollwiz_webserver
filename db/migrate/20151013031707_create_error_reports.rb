class CreateErrorReports < ActiveRecord::Migration
  def change
    create_table :error_reports do |t|
      t.string :version
      t.string :error_message
      t.boolean :closed
      t.text :note

      t.timestamps null: false
    end
  end
end
