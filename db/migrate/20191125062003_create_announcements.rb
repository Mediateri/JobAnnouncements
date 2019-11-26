class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
    end
  end
end
