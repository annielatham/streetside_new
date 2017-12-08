class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :last_name, :presence => true

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :length => { :minimum => 3, :maximum => 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
