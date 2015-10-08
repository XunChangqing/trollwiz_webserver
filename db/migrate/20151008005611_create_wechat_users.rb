class CreateWechatUsers < ActiveRecord::Migration
  def change
    create_table :wechat_users do |t|
      t.string :openid
      t.string :nickname
      t.string :headimgurl

      t.timestamps null: false
    end
    add_index :wechat_users, :openid, unique: true
  end
end
