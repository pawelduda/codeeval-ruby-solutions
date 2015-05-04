# https://www.codeeval.com/browse/174/

class SlangAdder
  def initialize
    @targets = /[\.\?\!]{1}/
    @replacements = [
      ', yeah!',
      ', this is crazy, I tell ya.',
      ', can U believe this?',
      ', eh?',
      ', aw yea.',
      ', yo.',
      '? No way!',
      '. Awesome!'
    ]
    @replacements_index = 0
    @should_replace_next = false
  end

  def add_slang(text)
    end_punctuation_marks = text.scan(@targets)

    text_with_slang = text.split(@targets).each_with_index.map do |sentence, index|
      if @should_replace_next
        sentence << @replacements[@replacements_index]
        @replacements_index >= @replacements.length - 1 ? @replacements_index = 0 : @replacements_index += 1  
      else
        sentence << end_punctuation_marks[index]
      end
      @should_replace_next = !@should_replace_next

      sentence
    end

    text_with_slang.join
  end
end

slang_adder = SlangAdder.new
File.open(ARGV[0]).each_line do |line|
  puts slang_adder.add_slang(line.strip) 
end

# tests
=begin
slang_adder = SlangAdder.new
p slang_adder.add_slang('Lorem ipsum dolor sit amet. Mea et habeo doming praesent. Te inani utroque recteque has, sea ne fugit verterem!') == 'Lorem ipsum dolor sit amet. Mea et habeo doming praesent, yeah! Te inani utroque recteque has, sea ne fugit verterem!'
p slang_adder.add_slang('Usu ei scripta phaedrum, an sed salutatus definiebas? Qui ut recteque gloriatur reformidans. Qui solum aeque sapientem cu.') == 'Usu ei scripta phaedrum, an sed salutatus definiebas, this is crazy, I tell ya. Qui ut recteque gloriatur reformidans. Qui solum aeque sapientem cu, can U believe this?'
p slang_adder.add_slang('Eu nam nusquam quaestio principes.') == 'Eu nam nusquam quaestio principes.'
=end
