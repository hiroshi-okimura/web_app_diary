class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :web_apps, through: :tagmaps
  has_many :users, through: :tagmaps

  validates :name, presence: true, length: { maximum: 30 }
end
