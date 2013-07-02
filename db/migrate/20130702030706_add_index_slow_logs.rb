class AddIndexSlowLogs < ActiveRecord::Migration
  def up
    add_index :slow_logs, :server, :name => "ix01_slow_logs"
    add_index :slow_logs, :user, :name => "ix02_slow_logs"
    add_index :slow_logs, :host, :name => "ix03_slow_logs"
    add_index :slow_logs, :created_at, :name => "ix04_slow_logs"
  end

  def down
    remove_index :slow_logs, :name => "ix01_slow_logs"
    remove_index :slow_logs, :name => "ix02_slow_logs"
    remove_index :slow_logs, :name => "ix03_slow_logs"
    remove_index :slow_logs, :name => "ix04_slow_logs"
  end
end
