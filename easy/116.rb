# https://www.codeeval.com/browse/116/

morse_code_table = {
  '.-' => 'a',
  '-...' => 'b',
  '-.-.' => 'c',
  '-..' => 'd',
  '.' => 'e',
  '..-.' => 'f',
  '--.' => 'g',
  '....' => 'h',
  '..' => 'i',
  '.---' => 'j',
  '-.-' => 'k',
  '.-..' => 'l',
  '--' => 'm',
  '-.' => 'n',
  '---' => 'o',
  '.--.' => 'p',
  '--.-' => 'q',
  '.-.' => 'r',
  '...' => 's',
  '-' => 't',
  '..-' => 'u',
  '...-' => 'v',
  '.--' => 'w',
  '-..-' => 'x',
  '-.--' => 'y',
  '--..' => 'z',
  '.----' => '1',
  '..---' => '2',
  '...--' => '3',
  '....-' => '4',
  '.....' => '5',
  '-....' => '6',
  '--...' => '7',
  '---..' => '8',
  '----.' => '9',
  '-----' => '0'
}

def decode_morse_code(msg, table)
  out = []

  msg.split('  ').map do |word|
    word.split(' ').map do |char|
      out << table[char].upcase
    end
    out << ' '
  end

  out.join.strip
end

File.open(ARGV[0]).each_line do |line|
  puts decode_morse_code(line.strip, morse_code_table)
end

# tests
=begin
p decode_morse_code('.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....', morse_code_table) == 'AV2WHIECX 45'
p decode_morse_code('-... .... ...--', morse_code_table) == 'BH3'
=end