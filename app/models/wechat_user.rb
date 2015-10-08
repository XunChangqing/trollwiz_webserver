class WechatUser < ActiveRecord::Base
  has_many :auth_info
end
