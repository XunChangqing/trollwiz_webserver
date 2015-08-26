class CreateWechatUsers < ActiveRecord::Migration
  def change
    create_table :wechat_users do |t|
      t.string :uuid
      t.string :access_token
      t.string :openid
      t.string :nick_name

      t.timestamps null: false
    end
    add_index :wechat_users, :uuid
    add_index :wechat_users, :openid
  end
end
