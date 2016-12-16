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




