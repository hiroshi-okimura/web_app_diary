FactoryBot.define do
  factory :web_app do
    site_name { "MyString" }
    url { "MyString" }
    ogp_title { "MyString" }
    ogp_description { "MyText" }
    ogp_image { "MyString" }
    screenshot { "MyString" }
    offer_date { "2023-07-20" }
    status { 1 }
  end
end
