class Announcement < ApplicationRecord
  
  validates :title, :body, presence: true
  validates :body, length: {maximum: 200}
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 2
  acts_as_votable
end
