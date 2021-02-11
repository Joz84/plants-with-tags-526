class PlantTag < ApplicationRecord
  belongs_to :plant
  belongs_to :tag

  validates :plant, uniqueness: { scope: :tag,
    message: "should happen once per plant" }
end
