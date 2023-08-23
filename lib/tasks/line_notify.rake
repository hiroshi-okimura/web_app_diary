namespace :line_notify do
  desc "LINE通知メッセージ送信"
  task send_line_message: :environment do
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }

    current_hour_utc = Time.current.utc.hour
    users_to_notify = User.where("EXTRACT(HOUR FROM notify_time AT TIME ZONE 'UTC') = ?", current_hour_utc)
    users_to_notify.each do |user|
      message = {
        type: 'text',
        text: "新しいWebアプリが提供されています!\n確認しましょう!(PC推奨です)\n\nhttps://web-app-diary-387ded82e725.herokuapp.com/"
      }
      response = client.push_message(user.uid, message)
      p response
    end
  end
end
