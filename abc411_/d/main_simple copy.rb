#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)


ss = {
  server: { left: nil, string: '' },
  pcs: [{ left: nil, string: '' }] * N
}


def calc(ss, t, p, s)
  if t == 1
    ss[:pcs][p] = ss[:server]
  elsif t == 2
    ss[:pcs][p] = { left: ss[:pcs][p], string: s }
  else # t == 3
    ss[:server] = ss[:pcs][p]
  end
end

Q.times do
  t, a1, a2 = STDIN.gets.chomp.split
  t = t.to_i
  a1 = a1.to_i - 1
  calc(ss, t, a1, a2)
end

ss = ss[:server]
rs = []
while ss != nil
  rs << ss[:string]
  ss = ss[:left]
end

puts rs.reverse.join('')

