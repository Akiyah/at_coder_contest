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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def calc(n, as)
  pp({n:, as:}) if $debug
  removes = []
  counts = []
  pre_paires = {}
  paires = {}
  r = 0

  last_a = nil
  last_b = nil
  as.each_cons(2) do |a, b|
    if a == b
      removes << a
    else
      next if last_b == b # 二重カウントしてしまう

      pre_paires[a] ||= {}
      pre_paires[b] ||= {}
      if pre_paires[a][b] == nil
        pre_paires[a][b] = 1
        pre_paires[b][a] = 1
      else
        paires[a] ||= {}
        paires[b] ||= {}
        paires[a][b] = 1
        paires[b][a] = 1
        r += 1

        counts[a] ||= 0
        counts[b] ||= 0
        counts[a] += 1
        counts[b] += 1
      end
    end

    last_a = last_b
    last_b = a
  end

  removes.each do |re|
    r -= (counts[re] || 0)
  end

  r
end



T.times do
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, as)
end
