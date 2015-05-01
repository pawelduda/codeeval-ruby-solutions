# https://www.codeeval.com/browse/136/

class RaceCar
  SECTION_WIDTH = 12

  public
  def initialize(race_track)
    @priorities = ['C', '_']
    @race_track = race_track
    @current_offset_y = 0
    @current_offset_x = nil
  end

  def race_track
    @race_track.join
  end

  def go!
    # Evaluating the track from 'bottom to top' because then the output is better to look at.
    @race_track.reverse!
    determine_starting_point
    # Iterate through every two adjacent sections
    0.step(@race_track.length, 1).each do |index|
      drive_thru_section(@race_track[index], @race_track[index + 1])
    end
    # After completing the track it gets reversed back to the worse version which outputs 
    # it according to requirements in this challenge. 
    @race_track.reverse!

    self
  end

  private
  def determine_starting_point
    @priorities.each do |priority|
      @current_offset_x = @race_track[0].index(priority)
      return if !@current_offset_x.nil?
    end
  end

  def drive_thru_section(current_section, next_section = nil)
    # If there is no next_section, assume we can safely drive forward
    if next_section.nil?
      @race_track[@current_offset_y][@current_offset_x] = drive_forward
      return
    end

    # Determine target
    target_offset_x = nil
    @priorities.each do |priority|
      target_offset_x = next_section.index(priority)
      break if !target_offset_x.nil?
    end

    # Determine direction based on target
    if @current_offset_x - 1 == target_offset_x
      @race_track[@current_offset_y][@current_offset_x] = steer_left
    elsif @current_offset_x + 1 == target_offset_x
      @race_track[@current_offset_y][@current_offset_x] = steer_right
    else
      @race_track[@current_offset_y][@current_offset_x] = drive_forward
    end

    @current_offset_y += 1
  end

  def steer_left
    @current_offset_x -= 1
    # Assuming the track is being processed from bottom to top.
    '\\'
  end

  def drive_forward
    '|'
  end

  def steer_right
    @current_offset_x += 1
    # Assuming the track is being processed from bottom to top.
    '/'
  end
end

race_track = []
IO.read(ARGV[0]).lines.each { |line| race_track << line }
race_car = RaceCar.new(race_track).go!
puts race_car.race_track

# tests
=begin
test_track = '#########_##
########C_##
#######_####
######_#C###
#######_C###
#######_####
######C#_###
######C_####
#######_####
#######_####'
completed_test_track = '#########|##
########/_##
#######/####
######_#\###
#######_|###
#######/####
######/#_###
######|_####
#######\####
#######|####'

car = RaceCar.new(test_track.lines)
car.go!

puts completed_test_track
puts
puts car.race_track

puts car.race_track == completed_test_track
=end
