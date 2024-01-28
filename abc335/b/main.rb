n = gets.chomp.to_i

data1 = (0..n).map do |x|
  (0..n).map do |y|
    (0..n).map do |z|
      [x, y, z]
    end
  end.flatten(1)
end.flatten(1)

# pp data1

data2 = data1.select do |x, y, z|
  x + y + z <= n
end

data3 = data2.sort


data3.each do |x, y, z|
  puts "#{x} #{y} #{z}"
end
