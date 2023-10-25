class WebApp < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  mount_uploader :screenshot, ScreenshotUploader
  mount_uploader :this_ogp, OgpImageUploader
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps

  validates :site_name, presence: true
  validates :url, presence: true, uniqueness: true
  validates :status, presence: true

  def self.today_app
    find_by(offer_date: Date.today)
  end

  def bookmark_count
    bookmarks.count
  end

  def save_tag(tag_names, user)
    current_tags = self.tags.joins(:tagmaps).where(tagmaps: { user_id: user.id })
    new_tags = tag_names - current_tags
    old_tags = current_tags - tag_names

    # 古いタグを削除
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    # 新しいタグを追加
    new_tags.each do |new_name|
      web_app_tag = Tag.find_or_create_by(name: new_name)
      Tagmap.create(web_app_id: self.id, tag_id: web_app_tag.id, user_id: user.id)
    end
  end
end
