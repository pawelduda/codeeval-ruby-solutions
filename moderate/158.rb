# https://www.codeeval.com/browse/158/

def parse_input(input)
  input = input.split(' | ')
  {
    numbers: input[0].split(' ').map(&:to_i),
    iterations: input[1].to_i
  }
end

def bubble_sort_limit(args)
  numbers = args[:numbers]
  iterations = args[:iterations]

  iterations.times do
    swaps_amount = 0

    (0..numbers.length - 2).each do |i| 
      if numbers[i + 1] < numbers[i]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
        swaps_amount += 1
      end
    end

    return numbers.join(' ') if swaps_amount == 0
  end

  numbers.join(' ')
end

# File.open(ARGV[0]).each_line { |line| puts bubble_sort_limit(parse_input(line)) }

# tests
p bubble_sort_limit(parse_input('36 47 78 28 20 79 87 16 8 45 72 69 81 66 60 8 3 86 90 90 | 1')) == '36 47 28 20 78 79 16 8 45 72 69 81 66 60 8 3 86 87 90 90'
p bubble_sort_limit(parse_input('40 69 52 42 24 16 66 | 2')) == '40 42 24 16 52 66 69'
p bubble_sort_limit(parse_input('54 46 0 34 15 48 47 53 25 18 50 5 21 76 62 48 74 1 43 74 78 29 | 6')) == '0 15 25 18 34 5 21 46 47 48 48 1 43 50 53 29 54 62 74 74 76 78'
p bubble_sort_limit(parse_input('48 51 5 61 18 | 2')) == '5 48 18 51 61'
p bubble_sort_limit(parse_input('59 68 55 31 73 4 1 25 26 19 60 0 | 2')) == '55 31 59 4 1 25 26 19 60 0 68 73'
