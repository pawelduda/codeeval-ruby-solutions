# https://www.codeeval.com/browse/163/

class BigAsciiNumber

  BIG_DIGITS = [
    "-**-\n*--*\n*--*\n*--*\n-**-\n----",
    "--*-\n-**-\n--*-\n--*-\n-***\n----",
    "***-\n---*\n-**-\n*---\n****\n----",
    "***-\n---*\n-**-\n---*\n***-\n----",
    "-*--\n*--*\n****\n---*\n---*\n----",
    "****\n*---\n***-\n---*\n***-\n----",
    "-**-\n*---\n***-\n*--*\n-**-\n----",
    "****\n---*\n--*-\n-*--\n-*--\n----",
    "-**-\n*--*\n-**-\n*--*\n-**-\n----",
    "-**-\n*--*\n-***\n---*\n-**-\n----"
  ]

  def initialize(number = nil)
    # start with 6 empty lines
    @state = "\n\n\n\n\n\n"
    @number = number
  end

  def insert_break
    @state = @state.lines.map { |line| line.chomp << "-\n" }.join
    self
  end

  def insert_number(number)
    @state = @state.lines.each_with_index.map do |line, index|
      line.chomp! << BIG_DIGITS[number].lines.map(&:to_s)[index]
    end.join
    self
  end

  def to_ascii
    @number.gsub(/[^\d]/, '').split('').each do |digit|
      self.insert_number(digit.to_i)
      self.insert_break
    end
    self
  end

  def to_s
    @state
  end
end

File.open(ARGV[0]).each_line do |line|
  big_ascii_number = BigAsciiNumber.new(line).to_ascii
  puts big_ascii_number
end

# tests
=begin
big_ascii_number = BigAsciiNumber.new('1.41421356').to_ascii
puts big_ascii_number
p '1.41421356'.gsub(/[^\d]/, '') == '141421356'
-**----*--***--***---*---****--**--****--**---**--
*--*--**-----*----*-*--*-*----*-------*-*--*-*--*-
*--*---*---**---**--****-***--***----*---**---***-
*--*---*--*-------*----*----*-*--*--*---*--*----*-
-**---***-****-***-----*-***---**---*----**---**--
--------------------------------------------------
=end
