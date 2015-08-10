require 'test_helper'

class TmpDomainNamesControllerTest < ActionController::TestCase
  setup do
    @tmp_domain_name = tmp_domain_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tmp_domain_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tmp_domain_name" do
    assert_difference('TmpDomainName.count') do
      post :create, tmp_domain_name: { domain_name: @tmp_domain_name.domain_name }
    end

    assert_redirected_to tmp_domain_name_path(assigns(:tmp_domain_name))
  end

  test "should show tmp_domain_name" do
    get :show, id: @tmp_domain_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tmp_domain_name
    assert_response :success
  end

  test "should update tmp_domain_name" do
    patch :update, id: @tmp_domain_name, tmp_domain_name: { domain_name: @tmp_domain_name.domain_name }
    assert_redirected_to tmp_domain_name_path(assigns(:tmp_domain_name))
  end

  test "should destroy tmp_domain_name" do
    assert_difference('TmpDomainName.count', -1) do
      delete :destroy, id: @tmp_domain_name
    end

    assert_redirected_to tmp_domain_names_path
  end
end
