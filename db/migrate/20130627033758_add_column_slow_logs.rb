class AddColumnSlowLogs < ActiveRecord::Migration
  def up
    add_column :slow_logs, :is_stocked, :boolean, :default => false
  end

  def down
    remove_column :slow_logs, :is_stocked
  end
end
