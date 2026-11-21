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


def calc
  ss = S.chars
  abc_counts = ss.tally
  abc_counts['A'] ||= 0
  abc_counts['B'] ||= 0
  abc_counts['C'] ||= 0
  pp(abc_counts:) if $debug

  lefts = []
  xs_l = {}
  xs_l['A'] = 0
  xs_l['B'] = 0
  xs_l['C'] = 0
  ss.each.with_index do |x, i|
    xs_l[x] += 1
    if ['A', 'B', 'C'].all? { |x0| 1 <= xs_l[x0] }
      if ['A', 'B', 'C'].all? { |x0| 2 <= abc_counts[x0] - xs_l[x0] }
        lefts << i
      end
    end
  end
  pp(xs_l:) if $debug
  pp(lefts:) if $debug
  return 0 if lefts.length == 0


  rights = []
  xs_r = {}
  xs_r['A'] = 0
  xs_r['B'] = 0
  xs_r['C'] = 0
  ss.reverse.each.with_index do |x, j|
    i = N - 1 - j
    xs_r[x] += 1
    if ['A', 'B', 'C'].all? { |x0| 1 <= xs_r[x0] }
      if ['A', 'B', 'C'].all? { |x0| 2 <= abc_counts[x0] - xs_r[x0] }
        rights << i - 1
      end
    end
  end
  pp(xs_r:) if $debug
  rights = rights.reverse
  pp(rights:) if $debug
  return 0 if rights.length == 0

  ans = 0

  xs_l = {}
  xs_l['A'] = 0
  xs_l['B'] = 0
  xs_l['C'] = 0

  xs_r = {}
  xs_r['A'] = 0
  xs_r['B'] = 0
  xs_r['C'] = 0

  (0..rights[0]).each do |i0|
    x0 = ss[i0]
    xs_r[x0] += 1
  end

  last_i_l = -1
  last_i_r = -1
  j_r = 0
  right_index = 0
  lefts.each do |i_l|
    pp(i_l:) if $debug
    ((last_i_l + 1)..i_l).each do |i0|
      x0 = ss[i0]
      xs_l[x0] += 1
    end
    pp(xs_l:) if $debug
    last_i_l = i_l

    while !['A', 'B', 'C'].all? { |x0| 1 <= xs_r[x0] - xs_l[x0] }
      last_i_r = rights[j_r]
      j_r += 1
      if rights.length <= j_r
        return ans
      end
      i_r = rights[j_r]
      ((last_i_r + 1)..i_r).each do |i0|
        x0 = ss[i0]
        xs_r[x0] += 1
      end
      pp(xs_r:) if $debug
    end

    pp(j_r:) if $debug

    ans += rights.length - j_r
    pp(ans:) if $debug
  end

  ans
end


r = calc
puts r
