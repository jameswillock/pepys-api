class CreateDiaryEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_entries do |t|
      t.datetime :published_on, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
