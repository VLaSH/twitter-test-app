class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :avatar, null: true
      t.string :first_name, limit: 35, null: false
      t.string :last_name, limit: 35, null: false
      t.string :email, limit: 55, null: false, index: true
      t.string :password_digest
      t.boolean :email_confirmed, default: false

      t.timestamps null: false
    end
  end
end
