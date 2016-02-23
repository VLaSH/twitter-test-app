class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false
      t.string :school, limit: 25
      t.string :website, limit: 25
      t.string :hobby, limit: 25
      t.string :status, limit: 25
      t.text :thinks, limit: 100

      t.timestamps null: false
    end
  end
end
