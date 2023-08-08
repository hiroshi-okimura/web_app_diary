class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :web_app

  validates :user_id, uniqueness: { scope: :web_app_id }
end
