# N = 200
# L = 200
N = 80
L = 40

as = N.times.map { rand(10 ** 5) }
as = as.uniq.sort
while as.length != N
  as = N.times.map { rand(10 ** 5) }
  as = as.uniq.sort
end

puts [N, L].join(' ')
puts as.join(' ')
