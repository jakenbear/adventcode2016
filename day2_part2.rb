# Advent Of Code 2016
# https://adventofcode.com/2016/day/2
# Part 2
# Read in the directions
directions = File.read("testdata/bathroom_codes.txt").split("\n").map(&:strip)
#directions = File.read("bathroom_codes_test.txt").split("\n").map(&:strip)

#INIT
$finger_pos = 5 #starting finger pos
$finger_pos_cord = [2,0] # y,x format
$door_digits = [] #Door Digit ARRAY

$up_edges = ["1","2","4","5","9"]
$down_edges = ["D","A","C","5","9"]
$right_edges = ["1","4","9","C","D"]
$left_edges = ["1","2","5","A","D"]

#LOOKUP MATRIX
$lookup_matrix = [
  ["0", "0", "1", "0", "0"],
  ["0", "2", "3", "4", "0"],
  ["5", "6", "7", "8", "9"],
  ["0", "A", "B", "C", "0"],
  ["0", "0", "D", "0", "0"]
]

#MATRIX FOR TRAVERSAL
$adj_matrix = [
  [0, 0, 1, 0, 0],
  [0, 1, 1, 1, 0],
  [1, 1, 1, 1, 1],
  [0, 1, 1, 1, 0],
  [0, 0, 1, 0, 0]
]

#Set limits
$max_x = $adj_matrix[0].size - 1
$max_y = $adj_matrix.size - 1

#Traversal Functions - Begin
def travel_right(y,x)
  if (x < $max_x)
    if ($adj_matrix[y][x+1] == 1)
      if (y > 0) && (y < $max_y)
        $finger_pos_cord[1] = x + 1
        puts "MOVED RIGHT"
        puts "UPDATED X:#{x} to #{$finger_pos_cord[1]}"
      end
    end
  end
end

def travel_left(y,x)
  if (x > 0)
    if ($adj_matrix[y][x-1] == 1)
      if (y > 0) && (y < $max_y)
        $finger_pos_cord[1] = x - 1
        puts "MOVED LEFT"
        puts "UPDATED X:#{x} to #{$finger_pos_cord[1]}"
      end
    end
  end
end

def travel_down(y,x)
  if (y < $max_y)
    if ($adj_matrix[y+1][x] == 1)
      if (x > 0) && (x < $max_x)
        $finger_pos_cord[0] = y + 1
        puts "MOVED DOWN"
        puts "UPDATED Y:#{y} to #{$finger_pos_cord[0]}"
      end
    end
  end
end

def travel_up(y,x)
  if (y > 0)
    if ($adj_matrix[y-1][x] == 1)
      if (x > 0) && (x < $max_x)
        $finger_pos_cord[0] = y - 1
        puts "MOVED UP"
        puts "UPDATED Y:#{y} to #{$finger_pos_cord[0]}"
      end
    end
  end
end
#Traversal Functions - End

loop = 0
#Loop through directions and update position # FIRST KEY PAD
directions.each do |i|
  turn = i
  for j in 0..(turn.size-1) do

    #Press Button
    if (turn[j] == "U")
      travel_up($finger_pos_cord[0],$finger_pos_cord[1])
    end

    if (turn[j] == "R")
      travel_right($finger_pos_cord[0],$finger_pos_cord[1])
    end

    if (turn[j] == "D")
      travel_down($finger_pos_cord[0],$finger_pos_cord[1])
    end

    if (turn[j] == "L")
      travel_left($finger_pos_cord[0],$finger_pos_cord[1])
    end
  end #for

  #Store final digits
  $door_digits.push [$finger_pos_cord[0],$finger_pos_cord[1]]
  loop += 1
end #each

puts $door_digits[0][0]
puts $door_digits[0][1]

print "REAL BATHROOM DOOR CODE IS: "
for j in 0..($door_digits.size-1) do
  print "#{$lookup_matrix[$door_digits[j][0]][$door_digits[j][1]]}"
end
puts ""

#PRINT FINAL RESULTS - KEYPAD 1

#puts "REAL BATHROOM DOOR CODE IS: #{door_digits[0]}#{door_digits[1]}#{door_digits[2]}#{door_digits[3]}#{door_digits[4]}"
