class Villa < ActiveRecord::Base
  belongs_to :destination

  attr_accessible :bathrooms, :bedrooms, :content, :latitude, :longitude, :name,
                  :observations, :rates, :sleeps, :destination_id

  validates :name,  :presence => true

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.latitude}, #{self.longitude}"
  end

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
