class School < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :handlings, dependent: :destroy
  has_many :subjects, through: :handlings, source: :subject
  has_one_attached :image
  validates :image, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w(id name prefecture city phone overview image created_at updated_at subject_id)
  end
  
  def self.ransackable_associations(auth_object = nil)
    %w(subjects)
  end
end
