N = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)
# pp AS


free_boxs = []
group_number = {}

AS.each.with_index do |a, i|
  if a == i + 1
    free_boxs << i + 1
  else
    group_number[a] ||= []
    group_number[a] << i + 1
  end
end

free_min_numbers = group_number.map do |a, is|
  is.min
end
free_numbers = free_boxs - group_number.keys + free_min_numbers
free_numbers.sort!

# pp free_boxs
# pp free_numbers

def calc(boxs, numbers)
  if boxs.length == 0
    return 1
  end
  numbers.select { |i| i <= boxs[0] } .sum do |i|
    calc(boxs[1..-1], numbers - [i])
  end % 998244353
end

if free_boxs.length != free_numbers.length
  puts 0
else
  puts calc(free_boxs, free_numbers)
end

# 998244353