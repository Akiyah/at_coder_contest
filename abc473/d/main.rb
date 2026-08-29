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


def calc(n, k, as, ass)
  pp(n:, k:, as:, ass:) if $debug
  if n == 1
    ass << [k] + as
    return
  end

  ((k / n) + 1).times do |j|
    calc(n - 1, k - (n * j), [j] + as, ass)
  end
end


ass = []
calc(N, K, [], ass)

ass.sort.each do |as|
  puts as.join(' ')
end
