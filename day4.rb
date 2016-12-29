# --- Day 4: Security Through Obscurity ---
#
# Finally, you come across an information kiosk with a list of rooms. Of course, the list is encrypted and full of
# decoy data, but the instructions to decode the list are barely hidden nearby. Better remove the decoy data first.
#
# Each room consists of an encrypted name (lowercase letters separated by dashes) followed by a dash, a sector ID,
# and a checksum in square brackets.
#
# A room is real (not a decoy) if the checksum is the five most common letters in the encrypted name, in order, with
# ties broken by alphabetization. For example:
#
# aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between
# x, y, and z, which are listed alphabetically.
# a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are
# listed alphabetically.
# not-a-real-room-404[oarel] is a real room.
# totally-real-room-200[decoy] is not.
#
# Of the real rooms from the list above, the sum of their sector IDs is 1514.
#
# What is the sum of the sector IDs of the real rooms?

def parse_name(name)
  name_parts = {}
  split_name = name.split(/(.*)-(\d+)\[(.*)\]/)
  name_parts[:name]=split_name[1]
  name_parts[:sector_id]=split_name[2]
  name_parts[:checksum]=split_name[3]
  name_parts
end

def sort_chars(name)
  puts "name=#{name}"
  name.gsub!("-","")
  chars = name.split("").uniq
  sorted_chars = chars.sort_by{|a|
    puts "a=#{a} name.count(a)=#{name.count(a)}"
    [-name.count(a), a]
  }
  puts sorted_chars
  sorted_chars
end

def first_five(sorted_chars)
  sorted_chars[0..4].join("")
end

def is_real?(parsed_input)
  name = parsed_input[:name]
  sorted_chars = sort_chars(name)

  checksum = parsed_input[:checksum]
  true
end

if ARGV[0] == "test"
  real1 = "aaaaa-bbb-z-y-x-123[abxyz]"
  real2 = "a-b-c-d-e-f-g-h-987[abcde]"
  real3 = "not-a-real-room-404[oarel]"
  decoy1 = "totally-real-room-200[decoy]"

  parsed_real1 = parse_name(real1)
  raise "wrong name '#{parsed_real1[:name]}'" if parsed_real1[:name]!="aaaaa-bbb-z-y-x"
  raise "wrong sector id '#{parsed_real1[:sector_id]}'" if parsed_real1[:sector_id]!="123"
  raise "wrong checksum '#{parsed_real1[:checksum]}'" if parsed_real1[:checksum]!="abxyz"
  first_five_sorted_chars = first_five(sort_chars(parsed_real1[:name]))
  raise "#{first_five_sorted_chars} should be abxyz" if first_five_sorted_chars != 'abxyz'
  raise "should be true" if is_real?(parsed_real1) != true

  parsed_real2 = parse_name(real2)
  raise "wrong name '#{parsed_real2[:name]}'" if parsed_real2[:name]!="a-b-c-d-e-f-g-h"
  raise "wrong sector id '#{parsed_real2[:sector_id]}'" if parsed_real2[:sector_id]!="987"
  raise "wrong checksum '#{parsed_real2[:checksum]}'" if parsed_real2[:checksum]!="abcde"
  first_five_sorted_chars = first_five(sort_chars(parsed_real2[:name]))
  raise "#{first_five_sorted_chars} should be abcde" if first_five_sorted_chars != 'abcde'
  raise "should be true" if is_real?(parsed_real2) != true

  parsed_real3 = parse_name(real3)
  raise "wrong name '#{parsed_real3[:name]}'" if parsed_real3[:name]!="not-a-real-room"
  raise "wrong sector id '#{parsed_real3[:sector_id]}'" if parsed_real3[:sector_id]!="404"
  raise "wrong checksum '#{parsed_real3[:checksum]}'" if parsed_real3[:checksum]!="oarel"
  first_five_sorted_chars = first_five(sort_chars(parsed_real3[:name]))
  raise "#{first_five_sorted_chars} should be oarell" if first_five_sorted_chars != 'oarel'
  raise "should be true" if is_real?(parsed_real3) != true

  # parsed_decoy1 = parse_name(decoy1)
  # raise "wrong name '#{parsed_decoy1[:name]}'" if parsed_decoy1[:name]!="totally-real-room"
  # raise "wrong sector id '#{parsed_decoy1[:sector_id]}'" if parsed_decoy1[:sector_id]!="200"
  # raise "wrong checksum '#{parsed_decoy1[:checksum]}'" if parsed_decoy1[:checksum]!="decoy"
  # raise "should be false" if is_real?(parsed_decoy1) != false

else
end
