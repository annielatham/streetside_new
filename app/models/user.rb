class User < ApplicationRecord
  # Direct associations

  has_many   :visitor_parking_permits,
             :foreign_key => "resident_id"

  has_many   :resident_parking_permits,
             :foreign_key => "resident_id"

  # Indirect associations

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
