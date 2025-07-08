$debug = false

N = 1000000

as = []

N.times do
  as << 0
end

N.times do
  as.pop
  pp({ l: as.length }) if $debug
end





as = []

N.times do
  as << 0
end

N.times do
  as = as[1..]
  pp({ l: as.length }) if $debug
end


