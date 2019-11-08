# Advent Of Code 2016
# https://adventofcode.com/2016/day/6
# Part 1 and 2
# Read in the directions
signals = File.read("testdata/signals.txt").split("\n").map(&:strip)
#directions = File.read("bathroom_codes_test.txt").split("\n").map(&:strip)
#HASH STORAGE
p1 = Hash.new{|h, k| h[k] = 0}
p2 = Hash.new{|h, k| h[k] = 0}
p3 = Hash.new{|h, k| h[k] = 0}
p4 = Hash.new{|h, k| h[k] = 0}
p5 = Hash.new{|h, k| h[k] = 0}
p6 = Hash.new{|h, k| h[k] = 0}
p7 = Hash.new{|h, k| h[k] = 0}
p8 = Hash.new{|h, k| h[k] = 0}


signals.each do |i|
  pos = 1
  i.each_char do |char|
    if (pos == 1)
      p1[char.to_s] += 1
    end
    if (pos == 2)
      p2[char.to_s] += 1
    end
    if (pos == 3)
      p3[char.to_s] += 1
    end
    if (pos == 4)
      p4[char.to_s] += 1
    end
    if (pos == 5)
      p5[char.to_s] += 1
    end
    if (pos == 6)
      p6[char.to_s] += 1
    end
    if (pos == 7)
      p7[char.to_s] += 1
    end
    if (pos == 8)
      p8[char.to_s] += 1
    end
    pos += 1
  end
end
#extract max
max1 = p1.key(p1.values.max)
max2 = p2.key(p2.values.max)
max3 = p3.key(p3.values.max)
max4 = p4.key(p4.values.max)
max5 = p5.key(p5.values.max)
max6 = p6.key(p6.values.max)
max7 = p7.key(p7.values.max)
max8 = p8.key(p8.values.max)

min1 = p1.key(p1.values.min)
min2 = p2.key(p2.values.min)
min3 = p3.key(p3.values.min)
min4 = p4.key(p4.values.min)
min5 = p5.key(p5.values.min)
min6 = p6.key(p6.values.min)
min7 = p7.key(p7.values.min)
min8 = p8.key(p8.values.min)

#Print password_pro
puts "THE SECRET WORD IS: #{max1}#{max2}#{max3}#{max4}#{max5}#{max6}#{max7}#{max8}"
puts "THE SECRET SANTA WORD IS: #{min1}#{min2}#{min3}#{min4}#{min5}#{min6}#{min7}#{min8}"
