class Recording < ApplicationRecord
  belongs_to :user
  
  # serialize :data, JSON
  
  validates :user, presence: true
  validates :data, presence: true
  
  def self.check_if_word_is_known(word)
  end 
  
  def words_with_confidence(confidence)
  end
  
  def new_words
  end 
  
end
