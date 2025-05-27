T = 100
puts T

T.times do 
  n = 3
  as = (2 * n).times.map { rand(1..10) }
  puts n
  as.each do |a|
    puts a
  end
end


