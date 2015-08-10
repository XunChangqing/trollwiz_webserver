require 'test_helper'

class BlackDomainNamesControllerTest < ActionController::TestCase
  setup do
    @black_domain_name = black_domain_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:black_domain_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create black_domain_name" do
    assert_difference('BlackDomainName.count') do
      post :create, black_domain_name: { domain_name: @black_domain_name.domain_name }
    end

    assert_redirected_to black_domain_name_path(assigns(:black_domain_name))
  end

  test "should show black_domain_name" do
    get :show, id: @black_domain_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @black_domain_name
    assert_response :success
  end

  test "should update black_domain_name" do
    patch :update, id: @black_domain_name, black_domain_name: { domain_name: @black_domain_name.domain_name }
    assert_redirected_to black_domain_name_path(assigns(:black_domain_name))
  end

  test "should destroy black_domain_name" do
    assert_difference('BlackDomainName.count', -1) do
      delete :destroy, id: @black_domain_name
    end

    assert_redirected_to black_domain_names_path
  end
end
