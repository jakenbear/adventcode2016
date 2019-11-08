# Advent Of Code 2016
# https://adventofcode.com/2016/day/2
# Part 1
# Read in the directions
directions = File.read("testdata/bathroom_codes.txt").split("\n").map(&:strip)
#directions = File.read("bathroom_codes_test.txt").split("\n").map(&:strip)

finger_pos = 5 #starting finger pos
door_digits = [] #Door Digit ARRAY

#Down
def press_down(f)
  if (f < 7)
      return f += 3
  else
      return f
  end
end

#Up
def press_up(f)
  if (f > 3)
      return f -= 3
  else
      return f
  end
end

#right
def press_right(f)
  if (f % 3 != 0)
    return f += 1
  else
    return f
  end
end

#left
def press_left(f)
  if ((f-1) % 3 != 0)
    return f -= 1
  else
    return f
  end
end

loop = 0
#Loop through directions and update position # FIRST KEY PAD
directions.each do |i|
  #turn = i.tr(" ", "") # Get Turn DIRECTION   EX. L, R
  turn = i
  #puts turn[0]
  for j in 0..(turn.size-1) do

    #Press Button
    if (turn[j] == "U")
      finger_pos = press_up(finger_pos)
    end

    if (turn[j] == "R")
      finger_pos = press_right(finger_pos)
    end

    if (turn[j] == "D")
      finger_pos = press_down(finger_pos)
    end

    if (turn[j] == "L")
      finger_pos = press_left(finger_pos)
    end
    #print finger_pos
  end # for loop

  #Store final digits
  door_digits.push finger_pos
  loop += 1

end

#puts loop
#PRINT FINAL RESULTS - KEYPAD 1
print "REAL BATHROOM DOOR CODE IS: "
for j in 0..(door_digits.size-1) do
  print "#{door_digits[j]}"
end
puts ""
#puts "REAL BATHROOM DOOR CODE IS: #{door_digits[0]}#{door_digits[1]}#{door_digits[2]}#{door_digits[3]}#{door_digits[4]}"
