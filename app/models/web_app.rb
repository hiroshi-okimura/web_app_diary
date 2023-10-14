class WebApp < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  mount_uploader :screenshot, ScreenshotUploader
  mount_uploader :this_ogp, OgpImageUploader

  validates :site_name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :status, presence: true
end
