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

N, K = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp


def calc
  cs = S.chars.map { |c| c == 'o' ? 1 : 0 }
  pp(cs:) if $debug

  js = []
  cs.each.with_index do |c, j|
    js << j if c == 1
  end

  pp(js:) if $debug

  sum_k_max = 0
  n = js.length
  (0..(n - K)).each do |i|
    j0 = js[i]
    j1 = js[i + K - 1]
    r = Rational(K, j1 - (j0 - 1))
    sum_k_max = r if sum_k_max < r
  end

  pp(sum_k_max:) if $debug

  last_r = 0
  is = []
  (0..(n - K)).each do |i|
    j0 = js[i]
    j1 = js[i + K - 1]
    r = Rational(K, j1 - (j0 - 1))
    is << i if sum_k_max == r
  end

  pp(is:) if $debug

  last_i = nil
  left_i = is[0]
  sum_max = sum_k_max
  is.each do |i|
    if i - 1 == last_i
    else
      left_i = i
    end
    pp(i:, last_i:, left_i:) if $debug

    j0 = js[left_i]
    j1 = js[i + K - 1]
    r = Rational(i + K - left_i, j1 - (j0 - 1))
    sum_max = r if sum_max < r
    pp(j0:, j1:, r:, sum_max:) if $debug

    last_i = i
  end

  pp(sum_max:) if $debug

  sum_max.to_f
end





ans = calc()
if ans == 1
  ans = 1
end
puts ans
