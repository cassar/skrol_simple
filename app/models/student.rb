class Student < ApplicationRecord
  validates :email, presence: true

  has_many :visits
  has_many :visited_slides, through: :visits, source: :slide
end
