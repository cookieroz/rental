class Destination < ActiveRecord::Base
  attr_accessible :airport, :info, :latitude, :longitude, :name, :rentcar, :todo, :weather,
                  :address, :villas_attributes, :dest_image_attributes

  validates :name,  :presence => true

  has_many :villas
  has_one :dest_image, as: :imageable, class_name: "Photo"

  accepts_nested_attributes_for :villas
  accepts_nested_attributes_for :dest_image

  acts_as_gmappable :latitude => 'latitude', :longitude => 'longitude', :process_geocoding => :geocode?,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  def geocode?
    (!address.blank? && (latitude.blank? || longitude.blank?)) || address_changed?
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
