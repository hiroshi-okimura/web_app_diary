# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


60.times do |n|
  WebApp.create(
    site_name: "サイト#{n + 101}",
    url: "https://www.site#{n + 101}.com",
    ogp_title: "サイト#{n + 101}のOGPタイトル",
    ogp_description: "サイト#{n + 101}のOGPディスクリプション",
    ogp_image: "ogp_image.png",
    screenshot: "not_found.png",
    offer_date: Date.new(2023, 10, 3) + n.days,
    status: 0
  )
end