# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


WebApp.create([
  {
    site_name: "食べログ",
    url: "https://tabelog.com/",
    ogp_title: "グルメ・レストランガイド",
    ogp_description: "全国にあるレストラン849,183件を一般ユーザーの口コミをもとに集計した様々なグルメランキングから探すことができます。美味しいレストランや、人気のレストランが簡単に見つかります！",
    ogp_image: "https://tabelog.com/images/rst/area/icon_fb_tabelog.gif",
    screenshot: "",
    offer_date: Date.today,
    status: 0
  },
  {
    site_name: "ここから始まる学校選び！熊本県立高校検索ガイド",
    url: "https://kumamoto-pref-hs.jp/",
    ogp_title: "ここから始まる学校選び！熊本県立高校検索ガイド",
    ogp_description: "熊本県内の公立高校の情報発信をしている公式サイトです。各高校の特徴や魅力が集約され、中学生やその保護者等の情報検索に便利なサイトです。",
    ogp_image: "https://kumamoto-pref-hs.jp/img/common/ogp.png",
    screenshot: "",
    offer_date: "",
    status: 0
  },
  {
    site_name: "楽天トラベル",
    url: "https://travel.rakuten.co.jp/",
    ogp_title: "楽天トラベル",
    ogp_description: "国内・海外旅行なら日本最大級の宿泊予約サイト「楽天トラベル」。ホテル・ツアー予約や航空券・レンタカー・高速バス予約、観光情報も満載！ホテルの口コミ数は1000万件以上で日本最大級！楽天ポイント貯まる・使える！",
    ogp_image: "https://www.site3.com/image3.jpg",
    screenshot: "",
    offer_date: "",
    status: 0
  }
])