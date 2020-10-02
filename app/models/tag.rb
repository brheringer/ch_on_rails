class Tag < ApplicationRecord
  has_and_belongs_to_many :entries

  validates :name, presence: true, 
                   length: {maximum:255, too_long: "%{count} characters is the maximum allowed"}
end
