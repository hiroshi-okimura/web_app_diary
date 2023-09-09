class AddWebappOfferDateToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :webapp_offer_date, :date
  end
end
