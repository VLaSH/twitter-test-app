class CreateUserSocialAccounts < ActiveRecord::Migration
  def change
    create_table :user_social_accounts do |t|
      t.references :user, null: false
      t.integer :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end
  end
end
