# Advent Of Code 2016
# https://adventofcode.com/2016/day/1
# Read in the directions to Easter Bunny HQ
directions = File.read("testdata/directions.txt").split(",").map(&:strip)

#Maps Letter Directions to an angle
$direction_map = {"E" => 0, "N" => 90, "W" => 180, "S" => 270}
#Maps Letter Turn Directions to an angle change
$turn_map = {"L" => 90, "R" => -90}
#Maps Direction Agle to Path vectors
$path_map = {0 => [1,0], 90 => [0,1], 180 => [-1,0], 270 => [0,-1]}

#Initialize Starting Data
xpos = 0
ypos = 0
current_dir = 90; #Start North
path_tracker = [[xpos,ypos]]
path_tracker_x = []
path_tracker_y = []
total_one_block_moves = 0;

#Function: Converts a traveling direction to a new direction
def map_direction_to_angle(dir)
  return $direction_map[dir]
end

def map_turn_to_angle(turn)
  return $turn_map[turn]
end

def make_turn(cur_dir,turn)
  return (cur_dir + turn) % 360
end

def move_in_steps(angle)

end

# 1. UPDATE TRAVEL DIRECTION
# 2. TRAVEL X AMOUNT OF SPACES IN THAT DIRECTION
# 3. UPDATE POSITION ARRAY

#Loop through directions and update position
directions.each do |i|
  steps = i.delete('^0-9').to_i #Get How many steps. Ex. 3, 5 , 18
  turn = i.tr("0-9", "")        # Get Turn DIRECTION   EX. L, R
  old_dir = current_dir  #Store your previous direction
  current_dir = make_turn(old_dir,map_turn_to_angle(turn)) #Get new direction
  #puts "TRAVEL LOG: #{old_dir},#{turn},#{steps},#{current_dir},"

  #Build up Our path ARRAY of every point on LINE (for part 2)
  jj = 1
  while jj <= steps
    cord = [xpos + ($path_map[current_dir][0] * jj), ypos + ($path_map[current_dir][1] * jj)]
    path_tracker.push cord
    jj+=1
    total_one_block_moves += 1
  end

  #PART 1 - Move us to new position
  if (current_dir == 0)
    xpos += steps
  end
  if (current_dir == 90)
    ypos += steps
  end
  if (current_dir == 270)
    ypos -= steps
  end
  if (current_dir == 180)
    xpos -= steps
  end
  puts "My position is: [#{xpos},#{ypos}]"
end # loop

# Give final block distance - Challenge 1
if (xpos < 0)
      puts "I am #{xpos.abs} Blocks WEST!"
elsif (xpos > 0)
      puts "I am #{xpos.abs} Blocks EAST!"
else
      puts "I am Neither EAST nor WEST"
end

if (ypos < 0)
      puts "I am #{ypos.abs} Blocks SOUTH!"
elsif (xpos > 0)
      puts "I am #{ypos.abs} Blocks NORTH!"
else
      puts "I am Neither NORTH nor SOUTH"
end

final_distance = xpos.abs + ypos.abs
puts "I am #{final_distance} BLOCKS away!!!"

#diplay Move list
plop = path_tracker.size
i = 1
  while i <= plop
#puts "#{path_tracker[i]}"
i += 1
end
puts "Total one block moves is: #{total_one_block_moves}"

#Challenge two - Easter Bunny HQ is the first place you visit twice.

#Iterte through move list with nested for loop to find first match.
for i in 1..(path_tracker.size - 1) do
  puts "(#{path_tracker[i][0]},#{path_tracker[i][1]})"
end

shortest_path = path_tracker.size #Set shortest path to Max length

for i in 1..(path_tracker.size - 1) do
  for j in (i+1)..(path_tracker.size - 1) do
      #Compare (i) to (j) - store j if collide && shorter than current max

      if path_tracker[i].to_s == path_tracker[j].to_s
        #Match found, check if shorter
        if (j < shortest_path)
            shortest_path = j
        end
      end
    end
  end

puts shortest_path
puts "INTERSECTION POINT: #{path_tracker[shortest_path][0]},#{path_tracker[shortest_path][1]}"
first_visited_twice = path_tracker[shortest_path][0].abs + path_tracker[shortest_path][1].abs
puts "FIRST LOCATION VISITED TWICE is #{first_visited_twice} blocks away!"
