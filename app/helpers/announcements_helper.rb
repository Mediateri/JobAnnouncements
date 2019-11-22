module AnnouncementsHelper
    def choose_both
        if action_name == 'new' || action_name == 'confirm'
          confirm_announcements_path
        elsif action_name == 'edit'
          announcement_path
        end
      end
end
