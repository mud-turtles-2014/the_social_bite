class CreateUsersConnectionsBitesTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end

    create_table :relationships do |t|
      t.references :follower
      t.references :followed_user

      t.timestamps
    end

    create_table :bites do |t|
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
