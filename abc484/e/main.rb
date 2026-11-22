#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, L, R = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, L:, R:) if $debug
pp(AS:) if $debug




def calc(ss, r, l) # vより小さくなる数
  pp(ss:, r:, l:) if $debug
  ans = 0
  ss2 = [0]

  segtree = AcLibraryRb::SegTree.new(N + 1, 0) { |x, y| x + y }

  sis = ss.map.with_index { |s, i| [s, i] }.sort
  pp(sis:) if $debug

  j_r = 0
  j_l = 0
  sis.each do |s, i|
    pp(s:, i:, j_r:, j_l:) if $debug

    while j_l <= N && sis[j_l][0] + (l - 1) < s
      s0, i0 = sis[j_l]
      segtree.set(i0, 1)
      j_l += 1
    end
    pp(j_l:) if $debug

    while j_r <= N && sis[j_r][0] + r < s
      s0, i0 = sis[j_r]
      segtree.set(i0, 0)
      j_r += 1
    end
    pp(j_r:) if $debug
    # pp(segtree:) if $debug

    # pp(segtree:) if $debug
    if $debug
      pp (N + 1).times.map { |i| segtree.get(i) }
    end

    d = segtree.prod(0, i)

    ans += d
    pp(i:, d:, ans:) if $debug
  end
  ans
end


s = 0
ss = []
ss << s
AS.each do |a|
  s += a
  ss << s
end
pp(ss:) if $debug

r = calc(ss, R, L)
pp(r:) if $debug

puts r