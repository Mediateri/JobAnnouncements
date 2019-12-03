require 'rails_helper'
RSpec.describe Announcement, type: :model do

    it "Validation does not pass if the title is empty" do
      announcement = Announcement.new(title: '', text: 'Failure test')
      expect(announcement).not_to be_valid
    end
  
    it "Validation does not pass if text is empty" do
      announcement = Announcement.new(title: 'test', text: '')
      expect(announcement).not_to be_valid
    end
  
    it "validation fails If text is not described in title and text" do
      announcement = Announcement.new(title: '', text: '')
      expect(announcement).not_to be_valid
    end
  end