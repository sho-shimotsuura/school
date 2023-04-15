class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :schools
  has_many :favorites, dependent: :destroy
  has_many :favorite_schools, through: :favorites, source: :school
  enum role: { general: 0, executive: 1 }
end
