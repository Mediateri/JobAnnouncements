class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :announcement
  def set_defaults_before_save
    self.my_boolean_field ||= false
  end
end
