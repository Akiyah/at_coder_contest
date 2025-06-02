#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def pick(aibs_sorted, bs, pq, n)
  while true
    aib1 = aibs_sorted.pop
    a1, i1, b1 = aib1
    next if bs[i1] != nil

    aib2 = pq.prod(i1 + 1, 2 * n)
    a2, i2, b2 = aib2
    next if !i2 || bs[i2] != nil

    return [aib1, aib2]
  end
end

def calc(n, as)
  bs = Array.new(2 * n)
  aibs = as.map.with_index { |a, i| [a, i, true]}
  aibs_sorted = aibs.sort_by { |a, i, b| a }

  pq = AcLibraryRb::SegTree.new(aibs, [10 ** 9 + 1, nil, false]) do |aib1, aib2|
    a1, i1, b1 = aib1
    a2, i2, b2 = aib2

    if b1 == b2
      a1 < a2 ? aib1 : aib2
    else
      b1 ? aib1 : aib2
    end
  end

  pp(n:, bs:, aibs:, aibs_sorted:) if $debug

  co = 0
  r = 0

  while true
    aib1, aib2 = pick(aibs_sorted, bs, pq, n)
    a1, i1, b1 = aib1
    a2, i2, b2 = aib2

    bs[i1] = '('
    bs[i2] = ')'

    pq.set(i1, [a1, i1, false])
    pq.set(i2, [a2, i2, false])

    r += a1
    co += 1

    return r if co == n
  end
end


T.times do |t|
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  # pp(t:, n:, as:) if $debug
  puts calc(n, as)
end


