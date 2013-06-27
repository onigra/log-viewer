require_relative '../test_helper'
require_relative "#{Rails.root}/script/batch/delete_over_one_month_record"

class DeleteOverOneMonthTest < ActiveSupport::TestCase
  def setup
    @obj = PurgeSlowLogs.new
  end

  test "#削除するデータの件数があってるか" do
    res = @obj.check
    assert_equal(res.count, 2, "件数チェックがまちがっている")
  end

  test "#データが削除できてて、DBに登録されている残件数が正しいか" do
    @obj.execute
    res = SlowLog.all
    assert_equal(res.count, 5, "削除が正しく行われていない")
  end

  test "#rails runnerでスクリプトが実行されるか" do
    res = system("cd #{Rails.root}; bundle exec rails runner script/batch/delete_over_one_month_record.rb check")
    assert_equal(res, true, "実行に失敗してる")
  end
end

