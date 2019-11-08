# Advent Of Code 2016
# https://adventofcode.com/2016/day/4
# Part 1 and 2
# Read in the directions
directions = File.read("testdata/roomcodes.txt").split("\n").map(&:strip)
$alpha_lookup = {"a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, "f" => 6,
                 "g" => 7, "h" => 8, "i" => 9, "j" => 10, "k" => 11, "l" => 12,
                 "m" => 13, "n" => 14, "o" => 15, "p" => 16, "q" => 17, "r" => 18,
                 "s" => 19, "t" => 20, "u" => 21, "v" => 22, "w" => 23, "x" => 24,
                 "y" => 25, "z" => 26, " " => 0}

def is_room_valid?(c1,c2)
  c1 == c2
end

def top_secret_decoder(number,rotateby)
  n = number + (rotateby % 26)
  #Wrap if needed
  if (n > 26)
        return (n % 26)
  else
        return n
  end
end

def top_secret_uncoder(number)
  #return letters
  return $alpha_lookup.key(number)
end

#Check sum get class
class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

#init sums
sector_sums = 0
directions.each do |i|
  num_code = i.delete('^0-9').to_i #Get letters only
  checksum = i.string_between_markers("[", "]")

  #Init hashmap
  h = Hash.new
  #update hashmap
  ("a".."z").each do |letter|
      letter_count = i.count(letter)
      h[letter] = letter_count
  end

  #sort
  hfinal = h.sort_by { |k,v| [-v,k] }
  test_checksum = "#{hfinal[0][0]}#{hfinal[1][0]}#{hfinal[2][0]}#{hfinal[3][0]}#{hfinal[4][0]}"

  #Check if room is valid
  if is_room_valid?(checksum,test_checksum)
    sector_sums += num_code
  end

end #each

#DISPLAY TOTAL sector_sums
puts "THE SUM OF THE VALID ROOM SECTORS IS: #{sector_sums}"

# PART TWO - CIPHER
directions.each do |i|
  to_decode = i.slice(0..(i.index('[')-1)).delete('0-9')
  num_code = i.delete('^0-9').to_i #Get letters only

  #Get decoded message
  final_message = ""
  puts "SECTOR ID: #{num_code}"
  to_decode.each_char do |char|
      #Get letter as number
      letter_as_num = $alpha_lookup[char.to_s]
      #puts letter_as_num
      # Rotate letter as number to new value based on formula
      if (letter_as_num == nil)
        decoded = 0
      else
        decoded = top_secret_decoder(letter_as_num,num_code)
      end
      #Print Final message
      the_sector_message = top_secret_uncoder(decoded)
      print the_sector_message

  end

  #print Final message
  print ("\n")


end
