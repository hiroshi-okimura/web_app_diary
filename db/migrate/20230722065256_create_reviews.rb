class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :web_app, null: false, foreign_key: true
      t.text :comment
      t.integer :originality_score
      t.integer :usability_score
      t.integer :design_score
      t.boolean :is_counted, default: false
      t.boolean :bookmark, default: false

      t.timestamps
    end
  end
end
