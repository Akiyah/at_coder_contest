$debug = false

N = 100000

as = []

N.times do |i|
  as << [i, i * i]
end

N.times do |i|
  as << [i, i * i]
  as.shift
  pp({ l: as.length }) if $debug
end





as = []

N.times do |i|
  as << [i, i * i]
end

N.times do |i|
  as << [i, i * i]
  as = as[1..]
  pp({ l: as.length }) if $debug
end


