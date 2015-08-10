class FixColumnNameOfDomainUpdateLog < ActiveRecord::Migration
  def change
    rename_column :domain_update_logs, :type, :operation
  end
end
