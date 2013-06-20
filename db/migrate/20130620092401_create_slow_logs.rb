class CreateSlowLogs < ActiveRecord::Migration
  def change
    create_table :slow_logs do |t|
      t.string :server
      t.string :user
      t.string :host
      t.float :query_time
      t.float :lock_time
      t.integer :rows_sent
      t.integer :rows_examined
      t.text :execute

      t.timestamps
    end
  end
end
