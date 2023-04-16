class School < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name", "prefecture"]
  end
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :handlings, dependent: :destroy
  has_many :handling_subjects, through: :handlings, source: :subject
end
