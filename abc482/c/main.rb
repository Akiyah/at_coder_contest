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

# N = STDIN.gets.chomp.to_i
H, W, N, Q = STDIN.gets.chomp.split.map(&:to_i)
RCS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
QUERIES = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
pp(H:, W:, N:, Q:) if $debug
pp(RCS:) if $debug
pp(QUERIES:) if $debug


rs = {}
cs = {}
RCS.each do |r1, c1|
  r = r1 - 1
  c = c1 - 1
  rs[r] ||= 0
  rs[r] += 1
  cs[c] ||= 0
  cs[c] += 1
end
pp(rs:) if $debug
pp(cs:) if $debug

rs_keys = rs.keys.sort
cs_keys = cs.keys.sort
pp(rs_keys:) if $debug
pp(cs_keys:) if $debug

sum_r = 0
sum_rs = {}
rs_keys.each do |r|
  sum_r += rs[r]
  sum_rs[r] = sum_r
end
pp(sum_rs:) if $debug

sum_c = 0
sum_cs = {}
cs_keys.each do |c|
  sum_c += cs[c]
  sum_cs[c] = sum_c
end
pp(sum_cs:) if $debug


QUERIES.each do |t, a, b|
  if t == 1
    u, d = a - 1, b - 1
    pp(t:, a:, b:, u:, d:) if $debug

    i_d1 = rs_keys.bsearch_index { |k| d < k }
    i_u1 = rs_keys.bsearch_index { |k| u <= k }
    pp(i_d1:, i_u1:) if $debug

    if i_d1 == nil
      ans1 = sum_rs[rs_keys[-1]]
    elsif i_d1 == 0
      ans1 = 0
    else
      k = rs_keys[i_d1 - 1]
      pp(k:) if $debug
      ans1 = sum_rs[k]
    end
    if i_u1 == nil
      ans2 = sum_rs[rs_keys[-1]]
    elsif i_u1 == 0
      ans2 = 0
    else
      k = rs_keys[i_u1 - 1]
      pp(k:) if $debug
      ans2 = sum_rs[k]
    end
    pp(ans1:, ans2:) if $debug

    ans = ans1 - ans2
  else
    l, r = a - 1, b - 1
    pp(t:, a:, b:, l:, r:) if $debug

    i_r1 = cs_keys.bsearch_index { |k| r < k }
    i_l1 = cs_keys.bsearch_index { |k| l <= k }
    pp(i_r1:, i_l1:) if $debug

    if i_r1 == nil
      ans1 = sum_cs[cs_keys[-1]]
    elsif i_r1 == 0
      ans1 = 0
    else
      k = cs_keys[i_r1 - 1]
      pp(k:) if $debug
      ans1 = sum_cs[k]
    end
    if i_l1 == nil
      ans2 = sum_cs[cs_keys[-1]]
    elsif i_l1 == 0
      ans2 = 0
    else
      k = cs_keys[i_l1 - 1]
      pp(k:) if $debug
      ans2 = sum_cs[k]
    end
    pp(ans1:, ans2:) if $debug

    ans = ans1 - ans2
  end
  puts ans
end




