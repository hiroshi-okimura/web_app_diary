namespace :db do
  desc "Update webapp_offer_date in reviews table"
  task update_webapp_offer_date: :environment do
    Review.find_each do |review|
      review.update(webapp_offer_date: review.web_app.offer_date)
    end
  end
end
