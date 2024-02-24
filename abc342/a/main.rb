S = gets.chomp.split('')

S.group_by(&:itself).each do |k, v|
  if 1 == v.size
    i = S.find_index(k)
    puts i + 1
  end
end
