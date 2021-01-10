class Slide < ApplicationRecord
  belongs_to :language

  validates :target_script, :english_latin, presence: true
  validates :target_script, uniqueness: true
end
