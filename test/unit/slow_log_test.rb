require_relative '../test_helper'

class SlowLogTest < ActiveSupport::TestCase
  test "#created_atが1ヵ月以上前かつis_stocked = falseのレコードが取得できる" do
    res = SlowLog.over_one_month
    assert_equal 2, res.size
  end
end
