require 'rails_helper'
RSpec.describe Comment, type: :model do

    it "Validation does not pass if the title is empty" do
      comment = Comment.new(  content: 'Failure test')
      expect(comment).not_to be_valid
    end
  
    it "Validation does not pass if text is empty" do
      comment = Comment.new(  content: '')
      expect(comment).not_to be_valid
    end
  
    it "validation passes If text is described in title and text" do
      comment = Comment.new(announcement_id: 'vv', content: 'Failure test')
      expect(comment).not_to be_valid
    end
  end