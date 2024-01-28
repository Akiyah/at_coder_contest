n = gets.chomp.to_i

s = n.to_s(2)

if s[-1] != '0'
  puts 0
else
  puts s.split('1')[-1].length
end