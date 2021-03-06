class CostCenter < ApplicationRecord
  belongs_to :universe
  validates :structure, presence: true, 
                        length: {maximum:64, too_long: "%{count} characters is the maximum allowed"},
                        format: { with: /[0-9]+(\.[0-9]+)*/, message: "Structure is something like 1.01.001" }
  validates :name, presence: true, 
                   length: {maximum:255, too_long: "%{count} characters is the maximum allowed"}
end
