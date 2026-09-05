#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
# require "ac-library-rb/lazy_segtree"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
Q = STDIN.gets.chomp.to_i


pp(N:, S:, Q:) if $debug

def check(bs, seg, l, r)

  # pp(methid: :check, bs:, seg: seg_to_a(seg), l:, r:) if $debug
  pp(methid: :check, bs:, l:, r:) if $debug

  # pp(seg.get(l - 1))
  # pp(seg.prod(l - 1, r))
  # seg.get(l - 1)[1] <= seg.prod(l - 1, r)[1]
  0 <= seg.prod(l - 1, r)[1]
end

def calc_1(bs, seg, i, c)
  pp(method: 'calc_1', i:, c:) if $debug
  b = (c == 'A' ? 1 : -1)
  if bs[i - 1] != b
    bs[i - 1] = b
    seg.set(i - 1, [b, b])
  end
  # pp(bs:, seg: seg_to_a(seg)) if $debug
  pp(bs:) if $debug
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

ds = bs.map { |b| [b, b] } # sum, min

# create segtree, 最小を探すsegtree
INF = 10 ** 6
seg = AcLibraryRb::Segtree.new(ds, [0, INF]) { |(s0, m0), (s1, m1)| [s0 + s1, [m0, s0 + m1].min] }

def seg_to_a(seg)
  n = seg.instance_variable_get(:@n)
  n.times.map { |i| seg.get(i) }
end

Q.times do
  query = STDIN.gets.chomp.split
  if query[0] == '1'
    calc_1(bs, seg, query[1].to_i, query[2])
  else
    calc_2(bs, seg, query[1].to_i, query[2].to_i)
  end
end

