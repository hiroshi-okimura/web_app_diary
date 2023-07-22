class WebApp < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :site_name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :status, presence: true
end
