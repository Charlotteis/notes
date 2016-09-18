# Exercise 25
module Ex25
  # This function will break up words for us.
  def self.break_words(stuff)
    words = stuff.split(' ')
    words
  end

  # Sorts the words.
  def self.sort_words(words)
    words.sort
  end

  # Prints the first word after shifting it off.
  def self.print_first_word(words)
    word = words.shift
    puts word
  end

  # Prints the last word after popping it off.
  def self.print_last_word(words)
    word = words.pop
    puts word
  end

  # Takes in a full sentence and returns the sorted words.
  def self.sort_sentence(sentence)
    words = break_words(sentence)
    sort_words(words)
  end

  # Prints the first and last words of the sentence.
  def self.print_first_and_last(sentence)
    words = break_words(sentence)
    print_first_word(words)
    print_last_words(words)
  end

  # Sorts the words then prints the first and last one.
  def self.print_first_and_last_sorted(sentence)
    words = sort_sentence(sentence)
    print_first_word(words)
    print_last_word(words)
  end
end
