class AddIndianPriceToArtistPhotos < ActiveRecord::Migration
  def self.up
    add_column :artist_photos, :indian_price, :decimal
  end

  def self.down
    remove_column :artist_photos, :indian_price
  end
end
