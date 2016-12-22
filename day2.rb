# --- Day 2: Bathroom Security ---
#
# You arrive at Easter Bunny Headquarters under cover of darkness. However, you left in such a rush that you forgot to use the bathroom! Fancy office buildings like this one usually have keypad locks on their bathrooms, so you search the front desk for the code.
#
# "In order to improve security," the document you find says, "bathroom codes will no longer be written down. Instead, please memorize and follow the procedure below to access the bathrooms."
#
# The document goes on to explain that each button to be pressed can be found by starting on the previous button and moving to adjacent buttons on the keypad: U moves up, D moves down, L moves left, and R moves right. Each line of instructions corresponds to one button, starting at the previous button (or, for the first line, the "5" button); press whatever button you're on at the end of each line. If a move doesn't lead to a button, ignore it.
#
# You can't hold it much longer, so you decide to figure out the code as you walk to the bathroom. You picture a keypad like this:
#
# 1 2 3
# 4 5 6
# 7 8 9
#
# Suppose your instructions are:
#
# ULL
# RRDDD
# LURDL
# UUUUD
#
# You start at "5" and move up (to "2"), left (to "1"), and left (you can't, and stay on "1"), so the first button is 1.
# Starting from the previous button ("1"), you move right twice (to "3") and then down three times (stopping at "9" after two moves and ignoring the third), ending up with 9.
# Continuing from "9", you move left, up, right, down, and left, ending with 8.
# Finally, you move up four times (stopping at "2"), then down once, ending with 5.
#
# So, in this example, the bathroom code is 1985.
#
# Your puzzle input is the instructions from the document you found at the front desk. What is the bathroom code?
#
# Your puzzle answer was 95549.
# --- Part Two ---
#
# You finally arrive at the bathroom (it's a several minute walk from the lobby so visitors can behold the many fancy conference rooms and water coolers on this floor) and go to punch in the code. Much to your bladder's dismay, the keypad is not at all like you imagined it. Instead, you are confronted with the result of hundreds of man-hours of bathroom-keypad-design meetings:
#
#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D
#
# You still start at "5" and stop when you're at an edge, but given the same instructions as above, the outcome is very different:
#
# You start at "5" and don't move at all (up and left are both edges), ending at 5.
# Continuing from "5", you move right twice and down three times (through "6", "7", "B", "D", "D"), ending at D.
# Then, from "D", you move five more times (through "D", "B", "C", "C", "B"), ending at B.
# Finally, after five more moves, you end at 3.
#
# So, given the actual keypad layout, the code would be 5DB3.
#
# Using the same instructions in your puzzle input, what is the correct bathroom code?
#
# Your puzzle answer was D87AD.

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

