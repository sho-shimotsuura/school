class Subject < ApplicationRecord
  has_many :handlings, dependent: :destroy
  has_many :handling_schools, through: :handlings, source: :school
end
