class DeleteAccessTokenFromWechatUsers < ActiveRecord::Migration
  def change
    remove_column :wechat_users, :access_token
  end
end
