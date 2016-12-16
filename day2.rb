# @keypad=[
#     [1,2,3],
#     [4,5,6],
#     [7,8,9]
# ]

@keypad=[
    %w(~ ~ 1 ~ ~),
    %w(~ 2 3 4 ~),
    %w(5 6 7 8 9),
    %w(~ A B C ~),
    %w(~ ~ D ~ ~)
]

# From the example http://adventofcode.com/2016/day/2
# instructions=%w(
#   ULL
#   RRDDD
#   LURDL
#   UUUUD
# )
# Part 1 should be 1986 given these instructions
# part 2 should be 5DB3 given these instructions

instructions=%w(
DLRURUDLULRDRUDDRLUUUDLDLDLRLRRDRRRLLLLLDDRRRDRRDRRRLRRURLRDUULRLRRDDLULRLLDUDLULURRLRLDUDLURURLDRDDULDRDRDLDLLULULLDDLRRUDULLUULRRLLLURDRLDDLDDLDRLRRLLRURRUURRRRLUDLRDDDDRDULRLLDDUURDUDRLUDULLUDLUDURRDRDUUUUDDUDLLLRLUULRUURDLRLLRRLRLLDLLRLLRRRURLRRLURRLDLLLUUDURUDDLLUURRDRDRRDLLDDLLRDRDRRLURLDLDRDLURLDULDRURRRUDLLULDUDRURULDUDLULULRRRUDLUURRDURRURRLRRLLRDDUUUUUDUULDRLDLLRRUDRRDULLLDUDDUDUURLRDLULUUDLDRDUUUDDDUDLDURRULUULUUULDRUDDLLLDLULLRLRLUDULLDLLRLDLDDDUUDURDDDLURDRRDDLDRLLRLRR
RLDUDURDRLLLLDDRRRURLLLRUUDDLRDRDDDUDLLUDDLRDURLDRDLLDRULDDRLDDDRLDRDDDRLLULDURRRLULDRLRDRDURURRDUDRURLDRLURDRLUULLULLDLUDUDRDRDDLDDDDRDURDLUDRDRURUDDLLLRLDDRURLLUDULULDDLLLDLUDLDULUUDLRLURLDRLURURRDUUDLRDDDDDRLDULUDLDDURDLURLUURDLURLDRURRLDLLRRUDRUULLRLDUUDURRLDURRLRUULDDLDLDUUDDRLDLLRRRUURLLUURURRURRLLLUDLDRRDLUULULUDDULLUDRLDDRURDRDUDULUDRLRRRUULLDRDRLULLLDURURURLURDLRRLLLDRLDUDLLLLDUUURULDDLDLLRRUDDDURULRLLUDLRDLUUDDRDDLLLRLUURLDLRUURDURDDDLLLLLULRRRURRDLUDLUURRDRLRUDUUUURRURLRDRRLRDRDULLDRDRLDURDDUURLRUDDDDDLRLLRUDDDDDURURRLDRRUUUDLURUUDRRDLLULDRRLRRRLUUUD
RDRURLLUUDURURDUUULLRDRLRRLRUDDUDRURLLDLUUDLRLLDDURRURLUDUDDURLURLRRURLLURRUDRUDLDRLLURLRUUURRUDDDURRRLULLLLURDLRLLDDRLDRLLRRDLURDLRDLDUDRUULLDUUUDLURRLLRUDDDUUURLURUUDRLRULUURLLRLUDDLLDURULLLDURDLULDLDDUDULUDDULLRDRURDRRLLDLDDDDRUDLDRRLLLRLLLRRULDLRLRLRLLDLRDRDLLUDRDRULDUURRDDDRLLRLDLDRDUDRULUDRDLDLDDLLRULURLLURDLRRDUDLULLDLULLUDRRDDRLRURRLDUDLRRUUDLDRLRLDRLRRDURRDRRDDULURUUDDUUULRLDRLLDURRDLUULLUDRDDDLRUDLRULLDDDLURLURLRDRLLURRRUDLRRLURDUUDRLRUUDUULLRUUUDUUDDUURULDLDLURLRURLRUDLULLULRULDRDRLLLRRDLU
RRRRDRLUUULLLRLDDLULRUUURRDRDRURRUURUDUULRULULRDRLRRLURDRRRULUUULRRUUULULRDDLLUURRLLDUDRLRRLDDLDLLDURLLUDLDDRRURLDLULRDUULDRLRDLLDLRULLRULLUDUDUDDUULDLUUDDLUDDUULLLLLURRDRULURDUUUDULRUDLLRUUULLUULLLRUUDDRRLRDUDDRULRDLDLLLLRLDDRRRULULLLDLRLURRDULRDRDUDDRLRLDRRDLRRRLLDLLDULLUDDUDDRULLLUDDRLLRRRLDRRURUUURRDLDLURRDLURULULRDUURLLULDULDUDLLULDDUURRRLDURDLUDURLDDRDUDDLLUULDRRLDLLUDRDURLLDRLDDUDURDLUUUUURRUULULLURLDUUULLRURLLLUURDULLUULDRULLUULRDRUULLRUDLDDLRLURRUUDRLRRRULRUUULRULRRLDLUDRRLL
ULRLDLLURDRRUULRDUDDURDDDLRRRURLDRUDDLUDDDLLLRDLRLLRRUUDRRDRUULLLULULUUDRRRDRDRUUUUULRURUULULLULDULURRLURUDRDRUDRURURUDLDURUDUDDDRLRLLLLURULUDLRLDDLRUDDUUDURUULRLLLDDLLLLRRRDDLRLUDDUULRRLLRDUDLLDLRRUUULRLRDLRDUDLLLDLRULDRURDLLULLLRRRURDLLUURUDDURLDUUDLLDDRUUDULDRDRDRDDUDURLRRRRUDURLRRUDUDUURDRDULRLRLLRLUDLURUDRUDLULLULRLLULRUDDURUURDLRUULDURDRRRLLLLLUUUULUULDLDULLRURLUDLDRLRLRLRDLDRUDULDDRRDURDDULRULDRLRULDRLDLLUDLDRLRLRUDRDDR
)

@horizontal_index,@vertical_index=0,2
@width=@keypad[0].size
@height=@keypad.size
@directions=%w(L U R D)
UP=-1
DOWN=1
LEFT=-1
RIGHT=1

def horizontal_move_is_still_on_keypad?(horizontal_coordinate, vertical_coordinate, amount, max_length)
  horizontal_coordinate_after_move = horizontal_coordinate + amount
  value_after_move = @keypad[vertical_coordinate][horizontal_coordinate_after_move]
  (horizontal_coordinate_after_move < max_length) &&
      (horizontal_coordinate_after_move >= 0) &&
      (value_after_move != "~")
end

def move_horizontally(horizontal_coordinate, vertical_coordinate, amount, max_length)
  if horizontal_move_is_still_on_keypad?(horizontal_coordinate, vertical_coordinate, amount, max_length)
    horizontal_coordinate += amount
  end
  horizontal_coordinate
end

def vertical_move_is_still_on_keypad?(horizontal_coordinate, vertical_coordinate, amount, max_length)
  vertical_coordinate_after_move = vertical_coordinate + amount
  return false if (vertical_coordinate_after_move >= max_length) || (vertical_coordinate_after_move < 0)

  value_after_move = @keypad[vertical_coordinate_after_move][horizontal_coordinate]
  return (value_after_move != "~")
end


def move_vertically(horizontal_coordinate, vertical_coordinate, amount, max_length)
  if vertical_move_is_still_on_keypad?(horizontal_coordinate, vertical_coordinate, amount, max_length)
    vertical_coordinate += amount
  end
  vertical_coordinate
end

if ARGV[0] == "test"
  # =========== HORIZONTAL MOVES
  # middle
  @vertical_index=2
  @horizontal_index=2
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, LEFT, @width)
  raise "#{@horizontal_index} should be 1" if @horizontal_index!=1

  # row 1 move left
  @vertical_index=0
  @horizontal_index=2
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, LEFT, @width)
  raise "#{@horizontal_index} should be 2" if @horizontal_index!=2

  # row 1 move right
  @vertical_index=0
  @horizontal_index=2
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, RIGHT, @width)
  raise "#{@horizontal_index} should be 2" if @horizontal_index!=2

  # row 2 left side
  @vertical_index=1
  @horizontal_index=1
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, LEFT, @width)
  raise "#{@horizontal_index} should be 1" if @horizontal_index!=1

  # row 2 right side
  @vertical_index=1
  @horizontal_index=3
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, RIGHT, @width)
  raise "#{@horizontal_index} should be 3" if @horizontal_index!=3

  # row 3 left side
  @vertical_index=2
  @horizontal_index=0
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, LEFT, @width)
  raise "#{@horizontal_index} should be 0" if @horizontal_index!=0

  # row 3 right side
  @vertical_index=2
  @horizontal_index=4
  @horizontal_index=move_horizontally(@horizontal_index, @vertical_index, RIGHT, @width)
  raise "#{@horizontal_index} should be 4" if @horizontal_index!=4


  # =========== VERTICAL MOVES
  # middle
  @vertical_index=2
  @horizontal_index=2
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, LEFT, @width)
  raise "#{@vertical_index} should be 1" if @vertical_index!=1

  # top, column 3, move up
  @vertical_index=0
  @horizontal_index=2
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, UP, @height)
  raise "#{@vertical_index} should be 0" if @vertical_index!=0

  # top, column 2, move up
  @vertical_index=1
  @horizontal_index=1
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, UP, @height)
  raise "#{@vertical_index} should be 1" if @vertical_index!=1

  # top, column 1, move up
  @vertical_index=2
  @horizontal_index=0
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, UP, @height)
  raise "#{@vertical_index} should be 2" if @vertical_index!=2

  # bottom, column 1, move down
  @vertical_index=2
  @horizontal_index=0
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, DOWN, @height)
  raise "#{@vertical_index} should be 2" if @vertical_index!=2

  # bottom, column 2, move down
  @vertical_index=3
  @horizontal_index=1
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, DOWN, @height)
  raise "#{@vertical_index} should be 3" if @vertical_index!=3

  # bottom, column 3, move down
  @vertical_index=4
  @horizontal_index=2
  @vertical_index=move_vertically(@horizontal_index, @vertical_index, DOWN, @height)
  raise "#{@vertical_index} should be 4" if @vertical_index!=4
else
  instructions.each do |line|
    line.each_char do |instruction|
      @horizontal_index = move_horizontally(@horizontal_index, @vertical_index, LEFT, @width) if instruction=="L"
      @horizontal_index = move_horizontally(@horizontal_index, @vertical_index, RIGHT, @width) if instruction=="R"
      @vertical_index = move_vertically(@horizontal_index, @vertical_index, DOWN, @height) if instruction=="D"
      @vertical_index = move_vertically(@horizontal_index, @vertical_index, UP, @height) if instruction=="U"
    end
    puts "DIGIT: #{@keypad[@vertical_index][@horizontal_index]}"
  end
end

