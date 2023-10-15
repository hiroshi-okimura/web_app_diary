class AddThisOgpToWebApps < ActiveRecord::Migration[7.0]
  def change
    add_column :web_apps, :this_ogp, :string
  end
end
