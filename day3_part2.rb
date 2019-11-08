# Advent Bathroom Code hacking - Simple
# Read in the directions
# EXPECTED ANSWER : 1649

directions = File.read("testdata/triangles.txt").split(" ").map(&:strip)
#directions = File.read("triangles_test.txt").split(" ").map(&:strip)
#puts directions
triangle_storage = []
triangle_temp1 = [-1,-1,-1]
triangle_temp2 = [-1,-1,-1]
triangle_temp3 = [-1,-1,-1]
triangle_factory = []
triangles = 0
total_sets = 0

def validate_triangle?(x,y,z)
  (x+y < z) || (x+z < y) || (y+z < x)
end

#GRAB TRIANGLES
roller = 0
directions.each do |i|

  if (roller == 0); triangle_temp1[0] = i; end;
  if (roller == 1); triangle_temp2[0] = i; end;
  if (roller == 2); triangle_temp3[0] = i; end;
  if (roller == 3); triangle_temp1[1] = i; end;
  if (roller == 4); triangle_temp2[1] = i; end;
  if (roller == 5); triangle_temp3[1] = i; end;
  if (roller == 6); triangle_temp1[2] = i; end;
  if (roller == 7); triangle_temp2[2] = i; end;
  if (roller == 8); triangle_temp3[2] = i; end;

  #reset
  if (roller < 8)
      roller += 1
  else
      roller = 0
      holder = [triangle_temp1[0].to_i,triangle_temp1[1].to_i,triangle_temp1[2].to_i]
      triangle_storage.push holder
      holder = [triangle_temp2[0].to_i,triangle_temp2[1].to_i,triangle_temp2[2].to_i]
      triangle_storage.push holder
      holder = [triangle_temp3[0].to_i,triangle_temp3[1].to_i,triangle_temp3[2].to_i]
      triangle_storage.push holder

      triangle_temp1[0] = -1
      triangle_temp1[1] = -1
      triangle_temp1[2] = -1
      triangle_temp1[3] = -1
      triangle_temp1[4] = -1
      triangle_temp1[5] = -1
      triangle_temp1[6] = -1
      triangle_temp1[7] = -1
      triangle_temp1[8] = -1
      total_sets += 3
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
