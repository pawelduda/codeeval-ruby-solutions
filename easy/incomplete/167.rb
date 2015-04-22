def trim_long_text(text)
  if text.size > 55
    text_ary = text[0..39].split(' ')
    if text_ary.size > 1
      text = text_ary[0..-2].join(' ').gsub(/[\,\;\(\)]$/, '') << '... <Read More>'
    else
      text = text_ary.join.gsub(/[\,\;\(\)]$/, '') << '... <Read More>'
    end
  end
  text
end

# tests
=begin
p trim_long_text('Tom exhibited.')
p trim_long_text('Tom exhibited.') == 'Tom exhibited.'

p trim_long_text("Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.") 
p trim_long_text("Amy Lawrence was proud and glad, and she tried to make Tom see it in her face - but he wouldn't look.") == "Amy Lawrence was proud and glad, and... <Read More>"

p trim_long_text("Tom was tugging at a button-hole and looking sheepish.")
p trim_long_text("Tom was tugging at a button-hole and looking sheepish.") == "Tom was tugging at a button-hole and looking sheepish."

p trim_long_text("Two thousand verses is a great many - very, very great many.") 
p trim_long_text("Two thousand verses is a great many - very, very great many.") == "Two thousand verses is a great many -... <Read More>"

p trim_long_text("Tom's mouth watered for the apple, but he stuck to his work.")
p trim_long_text("Tom's mouth watered for the apple, but he stuck to his work.") == "Tom's mouth watered for the apple, but... <Read More>"

p trim_long_text("123456789A123456789B123456789C123456789D123456789E123 5")
p trim_long_text("123456789A123456789B123456789C123456789D123456789E123 5") == "123456789A123456789B123456789C123456789D123456789E123 5"
=end