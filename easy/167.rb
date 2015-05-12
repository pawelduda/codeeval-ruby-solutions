# https://www.codeeval.com/browse/167/

def trim_long_text(text)
  if text.length > 55
    text = text[0..40].strip
    last_space_index = text.rindex(' ')
    text = text[0..last_space_index - 1] unless last_space_index.nil?
    text << '... <Read More>'
  end
  text
end

File.open(ARGV[0]).each_line do |line|
	puts trim_long_text(line.strip)
end

# tests
=begin
p trim_long_text('Tom exhibited.') == 'Tom exhibited.'
p trim_long_text("Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.") == "Amy Lawrence was proud and glad, and... <Read More>"
p trim_long_text("Tom was tugging at a button-hole and looking sheepish.") == "Tom was tugging at a button-hole and looking sheepish."
p trim_long_text("Two thousand verses is a great many - very, very great many.") == "Two thousand verses is a great many -... <Read More>"
p trim_long_text("Tom's mouth watered for the apple, but he stuck to his work.") == "Tom's mouth watered for the apple, but... <Read More>"
p trim_long_text("123456789A123456789B123456789C123456789D123456789E123 53") == "123456789A123456789B123456789C123456789D1... <Read More>"
=end
