class Recording < ApplicationRecord
  belongs_to :user
  
  # serialize :data, JSON
  
  validates :user, presence: true
end
