class Calculator
  def initialize(input)
    @input = input
  end
  
  def run
    original_chars_count = @input.length
    original_words_count = count_words(@input)
    @input = @input.gsub(/[^a-zA-Z ]/, '').gsub(/\s+/, '')
    @input = @input.scan(/.{1,10}/).join(' ').titleize
    new_words_count = count_words(@input)
    @input = upcase_special_vowels(@input)
    "#{original_words_count}-#{new_words_count}-#{count_uppercase_vowels(@input)}-#{count_consonants(@input)}-#{original_chars_count}"
  end
  
  private

  def count_uppercase_vowels(string)
    string.count('AEIOU')
  end

  def count_consonants(string)
    string.scan(/[^aeiou ]/i).count
  end  

  def count_words(string)
    string.split.size
  end

  def upcase_special_vowels(string)
    vowels = 'aeiou'.chars
    upcase_vowels = 'AEIOU '.chars
    upcase_vowel = false
    consonant_count = 0
    i = 0

    while i < string.length
      if upcase_vowels.include?(string[i])
        upcase_vowel = true unless string[i] == ' '
        consonant_count = 0
      elsif vowels.include?(string[i])
        if consonant_count >= 2 && upcase_vowel
          string[i] = string[i].upcase
          consonant_count = 0
        else  
          upcase_vowel = false
          consonant_count = 0
        end  
      else
        consonant_count += 1 
      end
      i +=1
    end
    string
  end
end