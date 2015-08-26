json.array!(@wechat_users) do |wechat_user|
  json.extract! wechat_user, :id, :uuid, :access_token, :openid, :nick_name
  json.url wechat_user_url(wechat_user, format: :json)
end
