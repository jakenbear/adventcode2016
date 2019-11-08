# Advent Of Code 2016
# https://adventofcode.com/2016/day/3
# Part 1

directions = File.read("testdata/triangles.txt").split(" ").map(&:strip)
#directions = File.read("triangles_test.txt").split(" ").map(&:strip)
#puts directions
triangle_storage = []
triangle_temp = [-1,-1,-1]
triangle_factory = []
triangles = 0
total_sets = 0

def validate_triangle?(x,y,z)
  (x+y < z) || (x+z < y) || (y+z < x)
end

#GRAB TRIANGLES
roller = 0
directions.each do |i|

  if (roller == 0)
    triangle_temp[0] = i
  end

  if (roller == 1)
    triangle_temp[1] = i
  end

  if (roller == 2)
    triangle_temp[2] = i
  end

  #reset
  if (roller < 2)
      roller += 1
  else
      roller = 0
      holder = [triangle_temp[0].to_i,triangle_temp[1].to_i,triangle_temp[2].to_i]
      triangle_storage.push holder
      triangle_temp[0] = -1
      triangle_temp[1] = -1
      triangle_temp[2] = -1
      total_sets += 1
  end
end

for j in 0..(triangle_storage.size-1) do
  puts "#{triangle_storage[j]}"
  if validate_triangle?(triangle_storage[j][0].to_i,triangle_storage[j][1].to_i,triangle_storage[j][2].to_i)
    triangles += 1
  end
end

puts "Valid Triangles: #{triangles}"
puts "Total test points: #{total_sets}"
