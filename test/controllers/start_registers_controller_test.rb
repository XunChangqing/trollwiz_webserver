require 'test_helper'

class StartRegistersControllerTest < ActionController::TestCase
  setup do
    @start_register = start_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:start_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create start_register" do
    assert_difference('StartRegister.count') do
      post :create, start_register: { note: @start_register.note, user_id: @start_register.user_id }
    end

    assert_redirected_to start_register_path(assigns(:start_register))
  end

  test "should show start_register" do
    get :show, id: @start_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @start_register
    assert_response :success
  end

  test "should update start_register" do
    patch :update, id: @start_register, start_register: { note: @start_register.note, user_id: @start_register.user_id }
    assert_redirected_to start_register_path(assigns(:start_register))
  end

  test "should destroy start_register" do
    assert_difference('StartRegister.count', -1) do
      delete :destroy, id: @start_register
    end

    assert_redirected_to start_registers_path
  end
end
