class CreateWechatScenes < ActiveRecord::Migration
  def change
    create_table :wechat_scenes do |t|
      t.string :openid

      t.timestamps null: false
    end
  end
end
