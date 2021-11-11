class AddIndexInEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :description
    add_index :events, :effective_date
  end
end
