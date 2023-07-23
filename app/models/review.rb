class Review < ApplicationRecord
  belongs_to :user
  belongs_to :web_app

  validates :originality_score, :usability_score, :design_score,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
