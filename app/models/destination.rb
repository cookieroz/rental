class Destination < ActiveRecord::Base
  attr_accessible :airport, :info, :latitude, :longitude, :name, :rentcar, :todo, :weather

  validates :name,  :presence => true

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
