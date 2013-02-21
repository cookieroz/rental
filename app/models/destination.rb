class Destination < ActiveRecord::Base
  attr_accessible :airport, :info, :latitude, :longitude, :name, :rentcar, :todo, :weather,
      :villas_attributes, :dest_image_attributes

  validates :name,  :presence => true

  has_many :villas
  has_one :dest_image, as: :imageable, class_name: "Photo"

  accepts_nested_attributes_for :villas
  accepts_nested_attributes_for :dest_image

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
