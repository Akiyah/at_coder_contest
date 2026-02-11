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

N, D = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  ais = AS.map.with_index { |a, i| [a, i]}

  bs = []
  r = -1
  ans = 0
  ais.each do |a, i|
    pp(a:, i:) if $debug
    j = bs.bsearch_index { |b| a - D < b[0] }
    pp(j:) if $debug
    if j
      # bs0 = bs[...j]
      r_new = r
      while bs[j] && bs[j][0] < a + D
        pp(j:, 'bs[j]' => bs[j]) if $debug
        r_new = bs[j][1] if r_new < bs[j][1]
        # j += 1
        bs.delete_at(j)
      end
      # bs = bs0 + [[a, i]] + bs[j...]
      bs.insert(j, [a, i])
      r = r_new
    else
      bs << [a, i]
    end
    ans += i - r
    pp(r:, bs:, ans:) if $debug
  end

  ans
end



puts calc

