require 'test_helper'

class ErrorReportsControllerTest < ActionController::TestCase
  setup do
    @error_report = error_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:error_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create error_report" do
    assert_difference('ErrorReport.count') do
      post :create, error_report: { closed: @error_report.closed, error_message: @error_report.error_message, note: @error_report.note, version: @error_report.version }
    end

    assert_redirected_to error_report_path(assigns(:error_report))
  end

  test "should show error_report" do
    get :show, id: @error_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @error_report
    assert_response :success
  end

  test "should update error_report" do
    patch :update, id: @error_report, error_report: { closed: @error_report.closed, error_message: @error_report.error_message, note: @error_report.note, version: @error_report.version }
    assert_redirected_to error_report_path(assigns(:error_report))
  end

  test "should destroy error_report" do
    assert_difference('ErrorReport.count', -1) do
      delete :destroy, id: @error_report
    end

    assert_redirected_to error_reports_path
  end
end
