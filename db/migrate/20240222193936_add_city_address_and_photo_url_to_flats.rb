class AddCityAddressAndPhotoUrlToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :city, :string
    add_column :flats, :address, :string
    add_column :flats, :photo_url, :string
    remove_column :flats, :location, :string
  end
end
