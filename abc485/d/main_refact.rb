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

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp


def abc_index(ss)
  abcs = {}
  n = 0
  ss.each.with_index do |x, i|
    if !abcs[x]
      abcs[x] ||= 0
      abcs[x] += 1
      n += 1      
    end
    return i if 3 <= n
  end

  return nil
end

def calc
  ss = S.chars

  i_l = abc_index(ss)
  i_r = abc_index(ss.reverse)
  pp(i_l:, i_r:) if $debug

  return 0 unless i_l
  return 0 unless i_r
  return 0 if N < (i_l + 1) + (i_r + 1)

  ss = ss[(i_l + 1)...(N - (i_r + 1))]
  n = ss.length
  pp(ss:, n:) if $debug

  j = -1
  ans = 0
  xs_i = { 'A' => 0, 'B' => 0, 'C' => 0 }
  xs_j = { 'A' => 0, 'B' => 0, 'C' => 0 }
  ss.each.with_index do |x, i|
    pp(x:, i:) if $debug
    pp(xs_i:) if $debug
    pp(xs_j:) if $debug
    while !['A', 'B', 'C'].all? { |x0| xs_i[x0] < xs_j[x0] }
      j += 1
      return ans if n <= j
      xs_j[ss[j]] += 1
    end
    pp(j:) if $debug
    pp(xs_j:) if $debug

    ans += n - j
    pp(ans:) if $debug

    xs_i[x] += 1
  end

  ans
end


r = calc
puts r
