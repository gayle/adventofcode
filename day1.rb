# --- Day 1: No Time for a Taxicab ---
#
# Santa's sleigh uses a very high-precision clock to guide its movements, and the clock's oscillator is regulated by stars. Unfortunately, the stars have been stolen... by the Easter Bunny. To save Christmas, Santa needs you to retrieve all fifty stars by December 25th.
#
# Collect stars by solving puzzles. Two puzzles will be made available on each day in the advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
#
# You're airdropped near Easter Bunny Headquarters in a city somewhere. "Near", unfortunately, is as close as you can get - the instructions on the Easter Bunny Recruiting Document the Elves intercepted start here, and nobody had time to work them out further.
#
# The Document indicates that you should start at the given coordinates (where you just landed) and face North. Then, follow the provided sequence: either turn left (L) or right (R) 90 degrees, then walk forward the given number of blocks, ending at a new intersection.
#
# There's no time to follow such ridiculous instructions on foot, though, so you take a moment and work out the destination. Given that you can only walk on the street grid of the city, how far is the shortest path to the destination?
#
# For example:
#
# Following R2, L3 leaves you 2 blocks East and 3 blocks North, or 5 blocks away.
# R2, R2, R2 leaves you 2 blocks due South of your starting position, which is 2 blocks away.
# R5, L5, R5, R3 leaves you 12 blocks away.
#
# How many blocks away is Easter Bunny HQ?
#
# Your puzzle answer was 234.
#
# --- Part Two ---
#
# Then, you notice the instructions continue on the back of the Recruiting Document. Easter Bunny HQ is actually at the first location you visit twice.
#
# For example, if your instructions are R8, R4, R4, R8, the first location you visit twice is 4 blocks away, due East.
#
# How many blocks away is the first location you visit twice?
#
# Your puzzle answer was 113.
#

input = "R2, L1, R2, R1, R1, L3, R3, L5, L5, L2, L1, R4, R1, R3, L5, L5, R3, L4, L4, R5, R4, R3, L1, L2, R5, R4, L2, R1, R4, R4, L2, L1, L1, R190, R3, L4, R52, R5, R3, L5, R3, R2, R1, L5, L5, L4, R2, L3, R3, L1, L3, R5, L3, L4, R3, R77, R3, L2, R189, R4, R2, L2, R2, L1, R5, R4, R4, R2, L2, L2, L5, L1, R1, R2, L3, L4, L5, R1, L1, L2, L2, R2, L3, R3, L4, L1, L5, L4, L4, R3, R5, L2, R4, R5, R3, L2, L2, L4, L2, R2, L5, L4, R3, R1, L2, R2, R4, L1, L4, L4, L2, R2, L4, L1, L1, R4, L1, L3, L2, L2, L5, R5, R2, R5, L1, L5, R2, R4, R4, L2, R5, L5, R5, R5, L4, R2, R1, R1, R3, L3, L3, L4, L3, L2, L2, L2, R2, L1, L3, R2, R5, R5, L4, R3, L3, L4, R2, L5, R5"
# input = "R2, L1, R2, R1, R1, R999"
# input = "R8, R4, R4, R8"
input = input.split(", ")

@facing = "up"
@directions=%w(left up right down)
@vertical=0
@horizontal=0
@visited=["0:0"]
@found=nil

def next_index(facing, go)
  d_index = @directions.index facing
  if go=="R"
    d_index += 1
    d_index = 0 if d_index > (@directions.size - 1)
  else
    d_index -= 1
    d_index = (@directions.size - 1) if d_index < 0
  end
  return d_index
end

def move_left(how_many)
  how_many.times do
    @horizontal -= 1
    save_coordinate
  end
end
def move_right(how_many)
  how_many.times do
    @horizontal += 1
    save_coordinate
  end
end
def move_up(how_many)
  how_many.times do
    @vertical += 1
    save_coordinate
  end
end
def move_down(how_many)
  how_many.times do
    @vertical -= 1
    save_coordinate
  end
end
def save_coordinate
  coordinates = "#{@horizontal}:#{@vertical}"
  puts "@facing=#{@facing}, @horizontal=#{@horizontal}, @vertical=#{@vertical} coordinates=#{coordinates}"
  if @found.nil? && @visited.index(coordinates) && (@visited.index(coordinates)>=0)
    @found = coordinates
  else
    @visited << coordinates
  end
end

if ARGV[0] == "test"
  # at end of array
  raise "BZZT" unless next_index("down", "R") == 0
  raise "BZZT" unless @directions[next_index("down", "R")] == "left"
  raise "BZZT" unless next_index("left", "L") == 3  # at beginning of array
  raise "BZZT" unless @directions[next_index("left", "L")] == "down"
else

  input.each do |move|
    puts "\nmove=#{move}"
    go = move[0]
    how_many = move[1..move.length-1].to_i
    d_index = next_index(@facing, go)
    @facing = @directions[d_index]
    move_left(how_many) if @facing=="left"
    move_right(how_many) if @facing=="right"
    move_up(how_many) if @facing=="up"
    move_down(how_many) if @facing=="down"
  end
  puts @horizontal.abs
  puts @vertical.abs
  puts @horizontal.abs+@vertical.abs
  puts "found? #{@found}"
  x,y = @found.split ":"
  puts "blocks away: #{x.to_i.abs+y.to_i.abs}"
end




