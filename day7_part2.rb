# Advent Day 7 IP checker - Part 2
# Read in the directions
ips = File.read("testdata/iplisttestssl.txt").split("\n").map(&:strip)
tls_ips = 0
checked = 0

#Checks for values between two markers
class String
  def string_between_markers marker1, marker2
    self[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end

def scan_back(s1)
  s1r = s1.reverse
  bracket = false
  s1r.each_char do |char|
    if (char == "[")
      return !bracket
    end
    if (char == "]")
      return bracket
    end
  end
  return bracket
end

def scan_forward(s1)
  bracket = false
  s1.each_char do |char|
    if (char == "]")
      return !bracket
    end
    if (char == "[")
      return bracket
    end
  end
  return bracket
end

def check_brackets?(s1,s2)

end

def palindrome?(string)
 if string == string.reverse && string.slice(0) != string.slice(1)
   return true
 else
   return false
 end
end

def is_aba?(string)
  if string.slice(0) == string.slice(2) && string.slice(0) != string.slice(1) && !string.include?("[") && !string.include?("]")
    return true
  else
    return false
  end
end

def isValid_tls_ip?(nv,v)
  (nv == 0) && (v > 0)
end

#PART 1
ips.each do |i|
  posl = 0
  posr = 2
  valid_count = 0
  non_valid_count = 0
  maxl = i.length
    while (posr < maxl)
      s1 = i.slice(posl..posr)
      if is_aba?(s1)
          puts "FOUND ABA: #{s1}"
          f_left = i.slice(0..posl-1)
          f_right = i.slice(posr+1..maxl)
          if scan_back(f_left) && scan_forward(f_right)
              puts "--> NOT VALID -- SURROUNDED BY []"
              non_valid_count +=1
          else
              puts "--> VALID"
              valid_count += 1
          end
      end
      posl += 1
      posr += 1
    end
#Parse final results
checked += 1
if isValid_tls_ip?(non_valid_count,valid_count)
  tls_ips += 1
end

end

#unit test_checksum
puts "TOTAL VALID TPS IPS: #{tls_ips}"
puts "CHECKED: #{checked}"
puts is_aba?("bab")
