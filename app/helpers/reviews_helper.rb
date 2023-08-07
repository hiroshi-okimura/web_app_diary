module ReviewsHelper
  def bookmarked?(user, web_app)
    review = Review.find_by(user_id: user.id, web_app_id: web_app.id)
    review&.bookmark || false
  end
end