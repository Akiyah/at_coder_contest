n, q = gets.chomp.split(' ').map(&:to_i)

s = ('A' .. 'Z').to_a[0...n]

result = s.sort do |a, b|
  puts "? #{a} #{b}"
  STDOUT.flush
  ans = gets.chomp
  #pp ans
  if ans == '>'
    1
  else
    -1
  end
end


# (0...(n - 1)).each do |i|
#   ((i + 1)...n).each do |j|
#     puts "? #{s[i]} #{s[j]}"
#     ans = gets.chomp
#     if ans == '>'
#       s[i], s[j] = s[j], s[i]
#     end
#   end
# end

puts "! #{result.join('')}"
STDOUT.flush
