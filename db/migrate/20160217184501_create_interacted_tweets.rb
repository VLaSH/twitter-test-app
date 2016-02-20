class CreateInteractedTweets < ActiveRecord::Migration
  def change
    create_table :interacted_tweets do |t|
      t.references :tweet, null: false
      t.references :user, null: false
      t.string :type, index: true

      t.timestamps null: false
    end
  end
end
