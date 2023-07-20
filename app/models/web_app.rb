class WebApp < ApplicationRecord
  validates :site_name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :status, presence: true
end
