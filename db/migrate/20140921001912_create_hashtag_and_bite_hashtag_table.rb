class CreateHashtagAndBiteHashtagTable < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashtag

      t.timestamps
    end

    create_tabe :bite_hashtags do |t|
      t.references :bite
      t.references :hashtag

      t.timestamps
  end
end
