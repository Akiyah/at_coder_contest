T = 1
puts T

T.times do 
  n = 2 * 10 ** 5
  as = (2 * n).times.map { rand(1..(10 ** 9)) }
  puts n
  as.each do |a|
    puts a
  end
end


