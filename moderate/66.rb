# https://www.codeeval.com/browse/66/
#
#    1
#   1 1
#  1 2 1
# 1 3 3 1
#
#              [0][0]
#          [1][0]   [1][1] 
#     [2][0]   [2][1]   [2][2]
#  [3][0]  [3][1]   [3][2]  [3][3]
#
# 1
# 1 1
# 1 2 1
# 1 3 3 1

class PascalTriangle
  def initialize(level)
    @rows = []
    triangle_up_to_level(level - 1)
  end

  def row_major_form
    @rows.flatten.join(' ')
  end

  private

  def triangle_up_to_level(level)
    (0..level).each do |current_level|
      @current_level = current_level
      @rows[@current_level] = []
      add_boundary_numbers(current_level)

      (0..elements_count_for_level(current_level) - 1).each do |i|
        @current_index = i
        @rows[@current_level][@current_index] = upper_left_element + upper_right_element if current_element.nil?
      end
    end
  end

  def elements_count_for_level(level)
    level + 1
  end

  def add_boundary_numbers(level)
    @rows[@current_level][0] = 1
    @rows[@current_level][elements_count_for_level(level) - 1] = 1 if level > 1
  end

  def current_element
    @rows[@current_level][@current_index]
  end

  def upper_left_element
    return 0 unless @rows[@current_level - 1] 
    @rows[@current_level - 1][@current_index - 1].nil? ? 0 : @rows[@current_level - 1][@current_index - 1]
  end

  def upper_right_element
    return 0 unless @rows[@current_level - 1] 
    @rows[@current_level - 1][@current_index].nil? ? 0 : @rows[@current_level - 1][@current_index]
  end
end

File.open(ARGV[0]).each_line do |depth|
  puts PascalTriangle.new(depth.to_i).row_major_form
end

# tests
# p PascalTriangle.new(1).row_major_form == '1'
# p PascalTriangle.new(2).row_major_form == '1 1 1'
# p PascalTriangle.new(3).row_major_form == '1 1 1 1 2 1'
# p PascalTriangle.new(4).row_major_form == '1 1 1 1 2 1 1 3 3 1'
# p PascalTriangle.new(5).row_major_form == '1 1 1 1 2 1 1 3 3 1 1 4 6 4 1'
# p PascalTriangle.new(6).row_major_form == '1 1 1 1 2 1 1 3 3 1 1 4 6 4 1 1 5 10 10 5 1'
