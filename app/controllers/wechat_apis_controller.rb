class WechatApisController < ApplicationController
  force_ssl except: [:binding, :auth, :jssdk_sign_package] unless Rails.env.development?
  #before_action :validate_wechat_client, except: [:error_report]
  before_action :validate_token, except: [:binding, :auth, :jssdk_sign_package]
  #layout 'first_price_bargain', except: [:index_joiners, :index_voters]
  #layout 'first_price_bargain_internal', only: [:index_joiners, :index_voters]
  layout 'wechat_apis'
  def jssdk_sign_package
    Rails.logger.info 'jsticket: '+$trollwiz_wechat_client.get_jsticket
    sign_package = $trollwiz_wechat_client.get_jssign_package(params[:url]) 
    #sign_package['rawString'] = nil
    if params[:callback]
      render json: sign_package.to_json, callback: params[:callback]
    else
      render json: sign_package
    end
  end
  def access_token
    #render json: {access_token: Wechat.api.access_token.token}
    access_token = $trollwiz_wechat_client.get_access_token
    Rails.logger.info 'access token: '+access_token
    render json: {access_token: access_token}
  end
  def create_scene
    @wechat_scene = WechatScene.new
    @wechat_scene.save
    #render json: {access_token: Wechat.api.access_token.token, scene_id: @wechat_scene.id}
    render json: {access_token: $trollwiz_wechat_client.access_token, scene_id: @wechat_scene.id}
  end
  def scene_info
    @wechat_scene = WechatScene.find_by_id params[:scene_id]
    render json: @wechat_scene
  end

  def get_user_info
    @wechat_user = WechatUser.find_by_openid params[:openid]
    render json: @wechat_user
  end
  
  def get_auth_info
    @wechat_user = WechatUser.find_by_openid params[:openid]
    @auth_info = AuthInfo.find_by_wechat_user_id @wechat_user.id
    render json: @auth_info
    @auth_info.used = true
    @auth_info.save
  end

  def binding
    wechat_auth
    #if @user_info
    #end
  end

  def auth
    wechat_auth
    if @wechat_user
      @auth_info = AuthInfo.find_by_wechat_user_id @wechat_user.id
      if @auth_info == nil
        @auth_info = AuthInfo.new
        @auth_info.wechat_user = @wechat_user
      end
      @auth_info.used = false
      @auth_info.save
    end
  end

  def error_report
    @error_report = ErrorReport.new
    @error_report.version = params[:version]
    @error_report.error_message = params[:errmsg]
    if @error_report.save
      render json: {error: 0}
    else
      render json: {error: 1}
    end
  end

private
def wechat_auth
  if(params[:code] == nil)
    Rails.logger.info "********************"
    Rails.logger.info "redirect to auth url"
    redirect_to $trollwiz_wechat_client.authorize_url(request.url, 'snsapi_userinfo')
  else
    sns_info = $trollwiz_wechat_client.get_oauth_access_token(params[:code])
    user_info = $trollwiz_wechat_client.get_oauth_userinfo(sns_info.result['openid'], sns_info.result['access_token'])
    #user_info.result['openid'] == nil
    @user_info = user_info.result
    @wechat_user = WechatUser.find_by_openid @user_info['openid']
    if @wechat_user == nil
      @wechat_user = WechatUser.new
      @wechat_user.openid = @user_info['openid']
    end
    @wechat_user.nickname = @user_info['nickname']
    @wechat_user.headimgurl = @user_info['headimgurl']
    @wechat_user.save
    #session[:user_info] = user_info.result
  end
end
  
def validate_token
  if params[:token] != Rails.application.config.trollwiz['token']
    render json: {"error":"invalid token"}
  end
end

#def validate_wechat_client
  #$trollwiz_wechat_client.is_valid?
#end
end
