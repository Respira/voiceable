class Recording < ApplicationRecord
  belongs_to :user
  
  # serialize :data, JSON
  
  validates :user, presence: true
  validates :data, presence: true
  
  def add_new_words(confidence, speaker)
    
    total_words_known = self.user.words_known_by_user
    new_words = []
    
    self.words_with_confidence(confidence, speaker).each do |word_with_confidence|
      word_known = false
      if total_words_known.any?      
        total_words_known.each do |known_word|
          word_known = true if known_word == word_with_confidence
        end
      end 
      
      unless word_known
        new_words << word_with_confidence
      end
    end 
    self.learning_words = new_words
  end 
  
  def words_with_confidence(confidence, speaker)
    # This defines the speaker:
    # data_hash['results'][1]['speaker'] > 1
    # This defines sentences:
    # self.data['results'][1]
    # This defines each words:
    # self.data['results'][1]["word_alternatives"][3]['alternatives'] > [{"confidence"=>0.515, "word"=>"and"}, {"confidence"=>0.3248, "word"=>"<eps>"}, {"confidence"=>0.043, "word"=>"in"}
    data = JSON.parse(self.data)
    words = []
    data['results'].each do |sentence|
      if sentence['speaker'] == speaker
        sentence["word_alternatives"].each do |word|
          word['alternatives'].each do |word_options|
            if word_options["confidence"] > confidence
              words << word_options["word"]
            end 
          end 
        end 
      end
    end
    words
  end

end
