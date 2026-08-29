#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
require "ac-library-rb/lazy_segtree"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
Q = STDIN.gets.chomp.to_i


pp(N:, S:, Q:) if $debug





def check(bs, seg, l, r)
  sum = 0
  bs[(l - 1)..(r - 1)].each do |b|
    sum += b
    return false if sum < 0
  end
  true
end

def calc_1(bs, seg, i, c)
  pp(method: 'calc_1', i:, c:) if $debug
  b = (c == 'A' ? 1 : -1)
  bs[i - 1] = b
  seg.apply(i, N, 1)
end

def calc_2(bs, seg, l, r)
  pp(method: 'calc_2', l:, r:) if $debug
  if check(bs, seg, l, r)
    puts 'Yes'
  else
    puts 'No'
  end
end

bs = S.chars.map { |c| c == 'A' ? 1 : -1 }


# create lazy segtree
e = 0
id = 0
op = proc { |x, y| x + y }
mapping = proc { |f, x| f + x }
composition = proc { |f, g| f + g }

ds = []
d = 0
bs.each do |b|
  d += b
  ds << d
end

seg = AcLibraryRb::LazySegtree.new(ds, e, id, op, mapping, composition)


Q.times do
  query = STDIN.gets.chomp.split
  if query[0] == '1'
    calc_1(bs, seg, query[1].to_i, query[2])
  else
    calc_2(bs, seg, query[1].to_i, query[2].to_i)
  end
end

