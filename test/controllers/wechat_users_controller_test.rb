require 'test_helper'

class WechatUsersControllerTest < ActionController::TestCase
  setup do
    @wechat_user = wechat_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wechat_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wechat_user" do
    assert_difference('WechatUser.count') do
      post :create, wechat_user: { headimgurl: @wechat_user.headimgurl, nickname: @wechat_user.nickname, openid: @wechat_user.openid }
    end

    assert_redirected_to wechat_user_path(assigns(:wechat_user))
  end

  test "should show wechat_user" do
    get :show, id: @wechat_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wechat_user
    assert_response :success
  end

  test "should update wechat_user" do
    patch :update, id: @wechat_user, wechat_user: { headimgurl: @wechat_user.headimgurl, nickname: @wechat_user.nickname, openid: @wechat_user.openid }
    assert_redirected_to wechat_user_path(assigns(:wechat_user))
  end

  test "should destroy wechat_user" do
    assert_difference('WechatUser.count', -1) do
      delete :destroy, id: @wechat_user
    end

    assert_redirected_to wechat_users_path
  end
end
