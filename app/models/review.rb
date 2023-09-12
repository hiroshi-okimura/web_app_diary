class Review < ApplicationRecord
  belongs_to :user
  belongs_to :web_app

  validates :originality_score, :usability_score, :design_score,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, uniqueness: { scope: %i[web_app_id webapp_offer_date] }

  before_create :set_webapp_offer_date

  def start_time
    self.webapp_offer_date
  end

  private

  def set_webapp_offer_date
    self.webapp_offer_date = web_app.offer_date
  end
end
