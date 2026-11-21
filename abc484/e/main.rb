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

N, L, R = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, L:, R:) if $debug
pp(AS:) if $debug




def calc(ss, r, l) # vより小さくなる数
  pp(ss:, r:, l:) if $debug
  ans = 0
  ss2 = [0]

  # segtree_r = AcLibraryRb::SegTree.new(N + 1, 1) { |x, y| x + y }
  # segtree_l = AcLibraryRb::SegTree.new(N + 1, 1) { |x, y| x + y }
  segtree_r = [1] * (N + 1)
  segtree_l = [1] * (N + 1)

  sis = ss.map.with_index { |s, i| [s, i] }.sort
  pp(sis:) if $debug

  j_r = 0
  j_l = 0
  sis.each do |s, i|
    pp(s:, i:, j_r:, j_l:) if $debug

    while j_r <= N && sis[j_r][0] + r < s
      s0, i0 = sis[j_r]
      segtree_r[i0] = 0
      j_r += 1
    end
    pp(j_r:) if $debug
    pp(segtree_r:) if $debug

    while j_l <= N && sis[j_l][0] + (l - 1) < s
      s0, i0 = sis[j_l]
      segtree_l[i0] = 0
      j_l += 1
    end
    pp(j_l:) if $debug
    pp(segtree_l:) if $debug

    d_r = segtree_r[0...i].sum
    d_l = segtree_l[0...i].sum
    ans += d_r - d_l
    pp(i:, d_r:, d_l:, ans:) if $debug
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