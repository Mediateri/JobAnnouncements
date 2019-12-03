require 'rails_helper'
RSpec.describe Comment, type: :model do

    it "Validation does not pass if the content is empty" do
      comment = Comment.new(  content: 'Failure test')
      expect(comment).not_to be_valid
    end
  
    it "Validation does not pass if conent is described and no announcement id is  empty" do
      comment = Comment.new(  content: 'niu')
      expect(comment).not_to be_valid
    end
  
    it "Validation does not pass if conent is described and  announcement id  is string " do
      comment = Comment.new(announcement_id: 'vv', content: 'Failure test')
      expect(comment).not_to be_valid
    end
  end