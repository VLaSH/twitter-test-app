class CreateRelatedUsers < ActiveRecord::Migration
  def change
    create_table :related_users do |t|
      t.references :user, null: false
      t.references :related, null: false
      t.string :type

      t.timestamps null: false
    end
  end
end
