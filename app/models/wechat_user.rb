class WechatUser < ActiveRecord::Base
  has_many :auth_info, dependent: :destroy
end
