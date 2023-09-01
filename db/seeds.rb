# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


30.times do |n|
  WebApp.create(
    site_name: "サイト#{n + 28}",
    url: "https://www.site#{n + 28}.com",
    ogp_title: "サイト#{n + 28}のOGPタイトル",
    ogp_description: "サイト#{n + 28}のOGPディスクリプション",
    ogp_image: "ogp_image.png",
    screenshot: "not_found.png",
    offer_date: Date.new(2023, 9, 1) + n.days,
    status: 0
  )
end