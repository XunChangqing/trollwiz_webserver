require 'test_helper'

class WhiteDomainNamesControllerTest < ActionController::TestCase
  setup do
    @white_domain_name = white_domain_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:white_domain_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create white_domain_name" do
    assert_difference('WhiteDomainName.count') do
      post :create, white_domain_name: { domain_name: @white_domain_name.domain_name }
    end

    assert_redirected_to white_domain_name_path(assigns(:white_domain_name))
  end

  test "should show white_domain_name" do
    get :show, id: @white_domain_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @white_domain_name
    assert_response :success
  end

  test "should update white_domain_name" do
    patch :update, id: @white_domain_name, white_domain_name: { domain_name: @white_domain_name.domain_name }
    assert_redirected_to white_domain_name_path(assigns(:white_domain_name))
  end

  test "should destroy white_domain_name" do
    assert_difference('WhiteDomainName.count', -1) do
      delete :destroy, id: @white_domain_name
    end

    assert_redirected_to white_domain_names_path
  end
end
