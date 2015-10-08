class CreateAuthInfos < ActiveRecord::Migration
  def change
    create_table :auth_infos do |t|
      t.references :wechat_user, index: {:unique=>true}, foreign_key: true
      t.boolean :used

      t.timestamps null: false
    end
  end
end
