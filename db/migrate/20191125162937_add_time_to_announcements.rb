class AddTimeToAnnouncements < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :announcements
  end
end
