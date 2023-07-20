class CreateWebApps < ActiveRecord::Migration[7.0]
  def change
    create_table :web_apps do |t|
      t.string :site_name, null: false
      t.string :url, null: false, unique: true
      t.string :ogp_title
      t.text :ogp_description
      t.string :ogp_image
      t.string :screenshot
      t.date :offer_date
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
