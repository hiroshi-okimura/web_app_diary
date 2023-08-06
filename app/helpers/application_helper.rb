module ApplicationHelper
  def default_meta_tags
    {
      site: 'WebAppDiary',
      title: 'WebAppDiary -1日1アプリ提供&記録サービス-',
      reverse: true,
      charset: 'utf-8',
      description: '個人開発の参考としてUI/UXの情報収集を継続的に行いたい人のための、 1日1Webアプリ提供&記録サービスです。',
      keywords: 'Webアプリ,UI/UX,個人開発,情報収集,日記,記録,1日1アプリ,Webアプリまとめ',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp_image.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
