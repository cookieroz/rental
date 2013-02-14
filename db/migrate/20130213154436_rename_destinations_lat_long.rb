class RenameDestinationsLatLong < ActiveRecord::Migration
  def change
    rename_column :destinations, :lat, :latitude
    rename_column :destinations, :lng, :longitude
  end
end
