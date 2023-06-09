class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :message, :limit => 240, null: false

      t.timestamps
    end
  end
end
