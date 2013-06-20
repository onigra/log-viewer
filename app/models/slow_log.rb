class SlowLog < ActiveRecord::Base
  attr_accessible :execute, :host, :lock_time, :query_time, :rows_examined, :rows_sent, :server, :user
end
