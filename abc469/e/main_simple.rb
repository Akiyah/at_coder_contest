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
ans = 0
(0...N).to_a.combination(2) do |l, r|
  pp(l:, r:) if $debug
  s = cs[l..r].sum
  if K <= s
    pp(s:) if $debug
    a = cs[l..r].sum.to_r / (r - l + 1)
    pp(a:) if $debug
    ans = a if ans < a
  end
end

puts ans.to_f

