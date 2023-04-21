class Subject < ApplicationRecord
  has_many :handlings, dependent: :destroy
  has_many :schools, through: :handlings, source: :school

  def self.ransackable_attributes(auth_object = nil)
    %w(id name created_at updated_at)
  end

  def self.ransackable_associations(auth_object = nil)
    %w(handlings schools)
  end
end
