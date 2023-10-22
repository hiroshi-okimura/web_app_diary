class CreateTagmaps < ActiveRecord::Migration[7.0]
  def change
    create_table :tagmaps do |t|
      t.references :web_app, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tagmaps, %i[web_app_id tag_id user_id], unique: true
  end
end
