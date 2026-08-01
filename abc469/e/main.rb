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

if K == 1
  puts 1
  exit
end

cs = S.chars.map { |c| c == 'o' ? 1 : 0 }
js = []
cs.each.with_index do |c, j|
  js << j if c == 1
end

def calc(k, cs, js, k_max)

  ans = 0
  (0..(k_max - k)).each do |j|
    j0 = js[j]
    j1 = js[j + k - 1]
    a = k.to_r / (j1 - (j0 - 1))
    ans = a if ans < a
  end
  ans
end

pp(js:) if $debug

k_max = js.length
ans = 0
(K..k_max).each do |k|
  a = calc(k, cs, js, k_max)
  if ans < a
    ans = a
  end
  pp(k:, a:, ans:) if $debug
end

puts ans.to_f

