# https://www.codeeval.com/browse/140/

def prepare_input(words_and_sequence)
  words, sequence = words_and_sequence.split(';').map { |part| part.split(' ') }
  sequence = sequence.map(&:to_i)
  [words, sequence]
end

def decode_text(words, sequence)
  decoded_text = []

  # Arrange words according to new indices given
  sequence.each_with_index do |new_index, old_index|
    decoded_text[new_index - 1] = words[old_index]
    # Keep entries in array instead of removing them to preserve old indices so we don't mess up the process
    words[old_index] = nil
  end

  # Remove nils since they are not needed at this point
  words.compact!

  # Fill gaps in the middle of the sentence by any leftover words
  decoded_text.each_with_index do |word, index| 
    if word.nil?
      decoded_text[index] = words[0]
      words.delete_at(0)
    end
  end

  # If there are any words left, append them to the sentence
  words.each { |word| decoded_text << word }

  decoded_text.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  words, text = prepare_input(line.strip)
  puts decode_text(words, text)
end

# tests
=begin
words, text = prepare_input('2000 and was not However, implemented 1998 it until;9 8 3 4 1 5 7 2')
p decode_text(words, text) == 'However, it was not implemented until 1998 and 2000'
words, text = prepare_input('programming first The language;3 2 1')
p decode_text(words, text) == 'The first programming language'
words, text = prepare_input('programs Manchester The written ran Mark 1952 1 in Autocode from;6 2 1 7 5 3 11 4 8 9')
p decode_text(words, text) == 'The Manchester Mark 1 ran programs written in Autocode from 1952'
=end
