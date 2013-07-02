require_relative '../test_helper'

class SlowLogsControllerTest < ActionController::TestCase
  setup do
    @slow_log = slow_logs(:one)
    @stock_flag_is_true = slow_logs(:six)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slow_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slow_log" do
    assert_difference('SlowLog.count') do
      post :create, slow_log: {
        execute:       @slow_log.execute,
        host:          @slow_log.host,
        lock_time:     @slow_log.lock_time,
        query_time:    @slow_log.query_time,
        rows_examined: @slow_log.rows_examined,
        rows_sent:     @slow_log.rows_sent,
        server:        @slow_log.server,
        user:          @slow_log.user
      }
    end

    assert_redirected_to slow_log_path(assigns(:slow_log))
  end

  test "should show slow_log" do
    get :show, id: @slow_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slow_log
    assert_response :success
  end

  test "should update slow_log" do
    put :update, id: @slow_log, slow_log: {
      execute:       @slow_log.execute,
      host:          @slow_log.host,
      lock_time:     @slow_log.lock_time,
      query_time:    @slow_log.query_time,
      rows_examined: @slow_log.rows_examined,
      rows_sent:     @slow_log.rows_sent,
      server:        @slow_log.server,
      user:          @slow_log.user
    }
    assert_redirected_to slow_log_path(assigns(:slow_log))
  end

  test "should destroy slow_log" do
    assert_difference('SlowLog.count', -1) do
      delete :destroy, id: @slow_log
    end

    assert_redirected_to slow_logs_path
  end

  test "is_stockedをfalseにする" do
    xhr :get, :stock, :id => @stock_flag_is_true.id
    assert_equal false, @stock_flag_is_true.reload.is_stocked
    assert_response :success
  end

end
