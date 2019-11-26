class AddProffesionToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_column :announcements, :owners, :string
  end
end
