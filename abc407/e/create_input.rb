T = 10
puts T

T.times do 
  # n = 2 * 10 ** 5
  n = 5
  as = (2 * n).times.map { rand(100) }
  puts n
  as.each do |a|
    puts a
  end
end


