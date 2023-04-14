class School < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name", "prefecture"]
  end
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
