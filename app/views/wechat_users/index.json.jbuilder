json.array!(@wechat_users) do |wechat_user|
  json.extract! wechat_user, :id, :openid, :nickname, :headimgurl
  json.url wechat_user_url(wechat_user, format: :json)
end
