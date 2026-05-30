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

MOD = 998244353
T = STDIN.gets.chomp.to_i


def calc(n, m)

  r = 0
  (1..n).each do |x|
    (1..n).each do |y|
      if (x + y - (x.to_s + y.to_s).to_i) % MOD == 0
        r += 1
      end
    end
  end

  r % MOD
end


T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  ans = calc(n, m)
  puts ans ? 'Yes' : 'No'

end


