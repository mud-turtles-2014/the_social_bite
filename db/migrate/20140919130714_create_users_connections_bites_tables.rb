class CreateUsersConnectionsBitesTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_user_id

      t.timestamps
    end

    create_table :bites do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
