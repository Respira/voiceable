class Recording < ApplicationRecord
  belongs_to :user
  
  # serialize :data, JSON
  
  validates :user, presence: true
  validates :data, presence: true
  
  def add_words_learned
    total_words = self.user.words_known_by_user
    
    self.words_learned = new_words
  end 
  
  def words
    
  end 
  
  
  
  def self.check_if_word_is_known(word)
  end 
  
  def words_with_confidence_first_speaker(confidence)
    # This defines the speaker:
    # data_hash['results'][1]['speaker'] > 1
    # This defines sentences:
    # self.data['results'][1]
    # This defines each words:
    # self.data['results'][1]["word_alternatives"][3]['alternatives'] > [{"confidence"=>0.515, "word"=>"and"}, {"confidence"=>0.3248, "word"=>"<eps>"}, {"confidence"=>0.043, "word"=>"in"}
    data = JSON.parse(self.data)
    words = []
    data['results'].each do |sentence|
      sentence["word_alternatives"].each do |word|
        word['alternatives'].each do |word_options|
          if word_options["confidence"] > confidence
            w = word_options["word"]
            c = word_options["confidence"]
            words << { "#{w}": c }
          end 
        end 
      end 
    end
    words
  end

end
