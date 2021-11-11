class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events, id: :uuid do |t|
      t.date :effective_date, null: false
      t.string :description, limit: 255, null: false
      t.string :image_url
      t.integer :status, default: 0
      t.references :category, type: :uuid, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
