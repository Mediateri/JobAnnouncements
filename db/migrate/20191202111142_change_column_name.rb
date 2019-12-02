class ChangeColumnName < ActiveRecord::Migration[5.2]
    def change
      rename_column :announcements, :body, :text
    end
end
