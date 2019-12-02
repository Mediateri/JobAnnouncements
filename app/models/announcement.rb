class Announcement < ApplicationRecord
  
  validates :title, :text, presence: true
  validates :text, length: {maximum: 255}
  belongs_to :user
  has_many :comments, dependent: :destroy
  paginates_per 2
  acts_as_votable
end
