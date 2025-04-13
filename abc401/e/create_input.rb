#!/usr/bin/env ruby

N = 200000
M = 300000
# N = 20000
# M = 30000

# N = 200
# M = 300

uvs = {}
m = 0

(2..(N/2)).step(1).each do |v|
  uvs[1] ||= {}
  uvs[1][v] = true
  m += 1
end

# pp({m:})


us = (1..N).to_a

(M - m).times do |i|
  # pp({i:}) if i % 100 == 0

  u, v = us.sample(2)
  u, v = v, u if v < u
  uvs[u] ||= {}
  uvs[u][v] = true
end


m = uvs.values.map { |vs| vs.keys.count }.sum

while m < M
  # pp({m:})
  u, v = us.sample(2)
  u, v = v, u if v < u
  if !(uvs[u] && uvs[u][v])
    uvs[u] ||= {}
    uvs[u][v] = true
    m += 1
  end
end


puts [N, M].join(' ')
uvs.each do |u, vs|
  vs.each do |v, _v|
    puts [u, v].join(' ')
  end
end
