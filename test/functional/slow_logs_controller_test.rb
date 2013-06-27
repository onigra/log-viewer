require_relative '../test_helper'

class SlowLogsControllerTest < ActionController::TestCase
  setup do
    @slow_log = slow_logs(:one)
    @stock_flag_is_true = SlowLog.find(6)
    @stock_flag_is_false = SlowLog.find(7)
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

  test "is_stockedをtrueにする" do
    session[:return_to] = "http://log-viewer.dev/"

    post :stock, id: @stock_flag_is_true, slow_log: {
      id:            @stock_flag_is_true.id,
      execute:       @stock_flag_is_true.execute,
      host:          @stock_flag_is_true.host,
      lock_time:     @stock_flag_is_true.lock_time,
      query_time:    @stock_flag_is_true.query_time,
      rows_examined: @stock_flag_is_true.rows_examined,
      rows_sent:     @stock_flag_is_true.rows_sent,
      server:        @stock_flag_is_true.server,
      user:          @stock_flag_is_true.user,
      is_stocked:    @stock_flag_is_true.is_stocked
    }

    assert_response :redirect
    assert_equal true, @stock_flag_is_true.is_stocked
  end

  test "is_stockedをfalseにする" do
    session[:return_to] = "http://log-viewer.dev/"

    post :stock, id: @stock_flag_is_false, slow_log: {
      id:            @stock_flag_is_false.id,
      execute:       @stock_flag_is_false.execute,
      host:          @stock_flag_is_false.host,
      lock_time:     @stock_flag_is_false.lock_time,
      query_time:    @stock_flag_is_false.query_time,
      rows_examined: @stock_flag_is_false.rows_examined,
      rows_sent:     @stock_flag_is_false.rows_sent,
      server:        @stock_flag_is_false.server,
      user:          @stock_flag_is_false.user,
      is_stocked:    @stock_flag_is_false.is_stocked
    }

    assert_response :redirect
    assert_equal false, @stock_flag_is_false.is_stocked
  end

end
