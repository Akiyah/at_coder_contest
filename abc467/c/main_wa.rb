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

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

cs = (0...(N-1)).map do |i|
  (AS[i] + AS[i + 1]) % 2 == BS[i]
end

pp(cs:) if $debug

def check_cs(cs)
  pp(method: 'check_cs', cs:) if $debug
  r = 0
  n = cs.length
  (0...n).each do |i|
    if cs[i]
    else
      r += 1
      cs[i] = !cs[i]
      cs[i + 1] = !cs[i + 1] if i + 1 < n
    end
    pp(i:, r:, cs:) if $debug
  end
  pp(r:) if $debug
  r
end

rs = []
n = cs.length
if n % 2 == 0
  m = n / 2

  r0 = 0
  if !cs[m - 1] && !cs[m]
    cs[m - 1] = true
    cs[m] = true
    r0 = 1
  end

  r1 = check_cs(cs[0...m].reverse)
  r2 = check_cs(cs[m...])
  rs << r0 + r1 + r2
else
  m = n / 2
  r1 = check_cs(cs[0...m].reverse)
  r2 = check_cs(cs[m...])
  rs << r1 + r2
  r1_ = check_cs(cs[0...(m + 1)].reverse)
  r2_ = check_cs(cs[(m + 1)...])
  rs << r1_ + r2_
end


r = rs.min
puts r

