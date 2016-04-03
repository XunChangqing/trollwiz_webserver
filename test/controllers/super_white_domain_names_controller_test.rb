require 'test_helper'

class SuperWhiteDomainNamesControllerTest < ActionController::TestCase
  setup do
    @super_white_domain_name = super_white_domain_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:super_white_domain_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create super_white_domain_name" do
    assert_difference('SuperWhiteDomainName.count') do
      post :create, super_white_domain_name: { domain_name: @super_white_domain_name.domain_name }
    end

    assert_redirected_to super_white_domain_name_path(assigns(:super_white_domain_name))
  end

  test "should show super_white_domain_name" do
    get :show, id: @super_white_domain_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @super_white_domain_name
    assert_response :success
  end

  test "should update super_white_domain_name" do
    patch :update, id: @super_white_domain_name, super_white_domain_name: { domain_name: @super_white_domain_name.domain_name }
    assert_redirected_to super_white_domain_name_path(assigns(:super_white_domain_name))
  end

  test "should destroy super_white_domain_name" do
    assert_difference('SuperWhiteDomainName.count', -1) do
      delete :destroy, id: @super_white_domain_name
    end

    assert_redirected_to super_white_domain_names_path
  end
end
