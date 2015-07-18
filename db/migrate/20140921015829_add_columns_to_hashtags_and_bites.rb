class AddColumnsToHashtagsAndBites < ActiveRecord::Migration
  def change
    add_column :bites, :hashtags_count, :integer
    add_column :hashtags, :bites_count, :integer
  end
end
