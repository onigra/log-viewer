class SlowLog < ActiveRecord::Base
  attr_accessible :is_stocked, :execute, :host, :lock_time, :query_time, :rows_examined, :rows_sent, :server, :user

  # validations
  validates_inclusion_of :is_stocked, :in => [ true, false ]

  scope :over_one_month, -> {
    where("created_at <= ? and is_stocked = ?", (Date.today << 1).strftime("%Y-%m-%d 00:00:00"), false)
  }
end
