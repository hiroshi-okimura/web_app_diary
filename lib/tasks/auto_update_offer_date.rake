namespace :web_apps do
  desc "特定のweb_appのoffer_dateを更新"
  task update_offer_date: :environment do
    # 今日の日付から150日前の日付を取得
    target_date = Date.today - 150.days

    # 100日前に提供されたアプリを探す
    web_app_to_update = WebApp.find_by(offer_date: target_date)

    # 今あるweb_appの中で、一番遠くの日付を取得
    latest_offer_date = WebApp.maximum(:offer_date)

    # 新しいoffer_dateを計算（一番遠くの日付 + 1日）
    new_offer_date = latest_offer_date + 1.day

    # 150日前に提供されたアプリのoffer_dateを更新
    if web_app_to_update
      web_app_to_update.update(offer_date: new_offer_date)
      puts "web_app (ID: #{web_app_to_update.id}) を新しいoffer_date: #{new_offer_date}に更新しました"
    else
      puts "offer_date: #{target_date}のweb_appはありませんでした"
    end
  end
end
