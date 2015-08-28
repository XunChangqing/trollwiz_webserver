class WechatApisController < ApplicationController
  before_action :validate_token
  def access_token
    render json: {access_token: Wechat.api.access_token.token}
  end
  def create_scene
    @wechat_scene = WechatScene.new
    @wechat_scene.save
    render json: {access_token: Wechat.api.access_token.token, scene_id: @wechat_scene.id}
  end
  def scene_info
    @wechat_scene = WechatScene.find_by_id params[:scene_id]
    render json: @wechat_scene
  end

private
def validate_token
  if params[:token] != Rails.application.config.trollwiz['token']
    render json: {"error":"invalid token"}
  end
  end
end
