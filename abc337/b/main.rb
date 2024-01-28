s = gets.chomp
as = s.split('')

#pp as
as.each_with_index do |a, i|
  if a != 'A'
    as = as[i..-1]
    break
  end
  if i == as.length - 1
    as = []
  end
end

#pp as
as.each_with_index do |a, i|
  if a != 'B'
    as = as[i..-1]
    break
  end
  if i == as.length - 1
    as = []
  end
end

##pp as
as.each_with_index do |a, i|
  if a != 'C'
    as = as[i..-1]
    break
  end
  if i == as.length - 1
    as = []
  end
end

#pp as
if as.length == 0
  puts 'Yes'
else
  puts 'No'
end
