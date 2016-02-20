class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :user, null: false
      t.string :body, limit: 100, null: false

      t.timestamps null: false
    end
  end
end
