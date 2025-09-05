$debug = false

N = 10000

as = []

N.times do |i|
  as << Object.new
end

N.times do |i|
  as << Object.new
  as << Object.new
  as << Object.new
  as << Object.new
  as.shift
  as.shift
  as.shift
  as.shift
  pp({ l: as.length }) if $debug
end





as = []

N.times do |i|
  as << Object.new
end

N.times do |i|
  as << Object.new
  as << Object.new
  as << Object.new
  as << Object.new
  as = as[1..]
  as = as[1..]
  as = as[1..]
  as = as[1..]
  pp({ l: as.length }) if $debug
end





as = []

N.times do |i|
  as << Object.new
end

N.times do |i|
  as << Object.new
  as << Object.new
  as << Object.new
  as << Object.new
  as = as[4..]
  pp({ l: as.length }) if $debug
end


as = []

N.times do |i|
  as << Object.new
end

N.times do |i|
  as << Object.new
  as << Object.new
  as << Object.new
  as << Object.new
  as = as[1..]
  as.shift
  as = as[1..]
  as.shift
  pp({ l: as.length }) if $debug
end



as = []

N.times do |i|
  as << Object.new
end

N.times do |i|
  as << Object.new
  as << Object.new
  as << Object.new
  as << Object.new
  as.shift
  as = as[1..]
  as.shift
  as = as[1..]
  pp({ l: as.length }) if $debug
end


