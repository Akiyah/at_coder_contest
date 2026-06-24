#!/usr/bin/env ruby

# N = 10 ** 5
# M = 10 ** 5
N = 1 * 10 ** 4
M = 1 * 10 ** 4
Y = rand(10 ** 9) + 1
XS = N.times.map { rand(10 ** 9) + 1 }

def create_uvts
  uvts = {}
  co = 0
  while co < M
    u = rand(N) + 1
    v = rand(N) + 1
    next if u == v
    u, v = v, u if v < u
    next if uvts[u] && uvts[u][v]

    t = rand(10 ** 9) + 1
    uvts[u] ||= {}
    uvts[u][v] = t
    co += 1
  end

  uvts
end

uvts = create_uvts

puts [N, M, Y].join(' ')

uvts.each do |u, vts|
  vts.each do |v, t|
    puts [u, v, t].join(' ')
  end
end

puts XS.join(' ')
