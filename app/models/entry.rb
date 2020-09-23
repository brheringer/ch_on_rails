class Entry < ApplicationRecord
  belongs_to :account
  belongs_to :cost_center
  belongs_to :universe
  has_and_belongs_to_many :tags
  validates :date, presence: true
  validates :value, presence: true
  validates :memo, presence: false
  validates :account, presence: true
  validates :cost_center, presence: true
  validates :universe, presence: true
  #tags not required
end
