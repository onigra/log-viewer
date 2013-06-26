class SlowLog < ActiveRecord::Base
  attr_accessible :execute, :host, :lock_time, :query_time, :rows_examined, :rows_sent, :server, :user

  scope :over_one_month, -> {
    where("created_at <= ?", (Date.today << 1).strftime("%Y-%m-%d 00:00:00"))
  }
end
