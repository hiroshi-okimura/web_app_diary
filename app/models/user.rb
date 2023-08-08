class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_web_apps, through: :bookmarks, source: :web_app

  enum role: { general: 0, admin: 1 }

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def bookmark(web_app)
    bookmark_web_apps << web_app
  end

  def unbookmark(web_app)
    bookmark_web_apps.destroy(web_app)
  end

  def bookmark?(web_app)
    bookmark_web_apps.include?(web_app)
  end
end
