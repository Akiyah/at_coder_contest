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

Q = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def update_as(k)
  j = 0
  y = 0
  i = $as.bsearch_index { |x, c, c_sum, xc_sum| $k_sum + k <= c_sum }

  if i == nil
    # ちょうど終わったとき
    $as = []
    return [$c_sum - $c_sum_used, $xc_sum - $xc_sum_used]
  end

  xi, ci, c_sumi, xc_sumi = $as[i]
  if i == 0
    [k, xi * k]
  else
    x2, c2, c_sum2, xc_sum2 = $as[i - 1]
    z = ($k_sum + k) - c_sum2 # i番目から必要な数

    [k, xc_sum2 + xi * z - $xc_sum_used]
  end
end


$as = []
$c_sum = 0
$c_sum_used = 0
$xc_sum = 0
$xc_sum_used = 0
$k_sum = 0
(1..Q).each do
  t, a1, a2 = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    c, x = a1, a2
    $c_sum += c
    $xc_sum += x * c
    $as << [x, c, $c_sum, $xc_sum]
  else # t == 2
    k = a1
    j, y = update_as(k)
    $k_sum += k
    $c_sum_used += j
    $xc_sum_used += y
    pp(y:) if $debug
    puts y
  end
  pp(as: $as, c_sum_used: $c_sum_used, xc_sum_used: $xc_sum_used) if $debug
end


