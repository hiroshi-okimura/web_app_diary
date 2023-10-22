class Tagmap < ApplicationRecord
  belongs_to :web_app
  belongs_to :tag
  belongs_to :user
end
