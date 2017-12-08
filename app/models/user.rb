require 'open-uri'
class User < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many    :visitor_parking_permits,
             :foreign_key => "resident_id"

  has_many   :resident_parking_permits, 
             :foreign_key => "resident_id"

  # Indirect associations

  has_many   :resident_vehicles,
             :through => :resident_parking_permits,
             :source => :resident_vehicle

  has_many   :visitor_pass_loans,
             :through => :visitor_parking_permits,
             :source => :loans

  # Validations

  validates :address, :presence => true

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :length => { :minimum => 3, :maximum => 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
