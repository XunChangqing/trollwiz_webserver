require 'test_helper'

class DomainUpdateLogsControllerTest < ActionController::TestCase
  setup do
    @domain_update_log = domain_update_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domain_update_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create domain_update_log" do
    assert_difference('DomainUpdateLog.count') do
      post :create, domain_update_log: { domain_name: @domain_update_log.domain_name, type: @domain_update_log.type }
    end

    assert_redirected_to domain_update_log_path(assigns(:domain_update_log))
  end

  test "should show domain_update_log" do
    get :show, id: @domain_update_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @domain_update_log
    assert_response :success
  end

  test "should update domain_update_log" do
    patch :update, id: @domain_update_log, domain_update_log: { domain_name: @domain_update_log.domain_name, type: @domain_update_log.type }
    assert_redirected_to domain_update_log_path(assigns(:domain_update_log))
  end

  test "should destroy domain_update_log" do
    assert_difference('DomainUpdateLog.count', -1) do
      delete :destroy, id: @domain_update_log
    end

    assert_redirected_to domain_update_logs_path
  end
end
