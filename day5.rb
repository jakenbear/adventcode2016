# Advent Of Code 2016
# https://adventofcode.com/2016/day/5
# Part 1 - hack_mode 0 and 2 hack mode 1
require 'digest'
# Read in the directions
doorcode = "abbhdwsy"
hack_mode = 1  #0=simple (part 1), 1 = advanced (part 2)

password = "" #start with blank password
password_pro = [-1,-1,-1,-1,-1,-1,-1,-1]

def jakehash(st1)
  return Digest::MD5.hexdigest st1
end

def isValidFragment?(frag)
   (frag.slice(0..4) == "00000")
end

def can_exit?(pw)
  (pw[0] != -1) && (pw[1] != -1) && (pw[2] != -1) && (pw[3] != -1) && (pw[4] != -1) && (pw[5] != -1) && (pw[6] != -1) && (pw[7] != -1)
end

if (hack_mode == 0)
  #SIMPLE DOOR HACK
  #Loop until we have 8 hits
  hits = 0
  i = 0
  loop do
    frag = jakehash(doorcode + i.to_s)
    if isValidFragment?(frag)
      password += frag.slice(5)
      puts("FOUND FRAGMENT!")
      hits += 1
    end

    i += 1 # Increment i
    print "."
    if hits == 8
      break
    end
  end #do
  puts "THE PASSWORD IS: #{password}"
else #end hack mode 0
   #ADVANCED DOOR HACK
   hits = 0
   i = 0
   current_pos = 1
   loop do
     frag = jakehash(doorcode + i.to_s)
     if isValidFragment?(frag)
       validPos = frag.slice(5)
       if (validPos.to_i < 8) && (password_pro[validPos.to_i] == -1)
         password_pro[validPos.to_i] = frag.slice(6)
         puts("FOUND FRAGMENT!")
         hits += 1
       end
     end

     i += 1 # Increment i
     print "."
     if can_exit?(password_pro)
       break
     end
   end #do

   puts "THE PASSWORD IS: #{password_pro[0]}#{password_pro[1]}#{password_pro[2]}#{password_pro[3]}#{password_pro[4]}#{password_pro[5]}#{password_pro[6]}#{password_pro[7]}"
end
