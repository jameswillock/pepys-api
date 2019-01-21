class CreateDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_entries do |t|
      t.date :published_on, null: false, index: true
      t.text :text, null: false

      t.timestamps
    end
  end
end
