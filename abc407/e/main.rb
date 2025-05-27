#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc(n, as)
  paires = (0...(2 * n - 1)).map { |i| [i, i + 1] }
  pq = AcLibraryRb::PriorityQueue.new(paires) { |(i1, j1), (i2, j2)| as[i1] - as[j1] > as[i2] - as[j2] }
  is = Array.new(2 * n, true)
  co = 0
  r = 0

  pp(pq:, is:, co:, r:) if $debug

  while co < n
    i, j = pq.pop
    pp(co:, n:, r:, i:, j:, is:, pq:) if $debug
    if is[i] && is[j]
      is[i] = false
      is[j] = false
      co += 1
      r += as[i]
      if 0 <= i - 1 && j + 1 < 2 * n
        pq.push([i - 1, j + 1])
      end
    end
  end

  r
end


T.times do |t|
  pp(t:) if $debug
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  puts calc(n, as)
end


