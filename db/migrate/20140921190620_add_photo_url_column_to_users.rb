class AddPhotoUrlColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo_url, :string, :default => "http://tadcaster.yoursquaremile.co.uk/img/default-profile-pic.png"
  end
end
