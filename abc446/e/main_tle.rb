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

M, A, B = STDIN.gets.chomp.split.map(&:to_i)

def check(x, y, as, bs)
  pp(x:, y:) if $debug
  (1..(2 * M)).each do |i|
    return false if (as[i] * x + bs[i] * y) % M == 0
  end
  # ss = [x, y]
  # (2..(M + M)).each do |j|
  #   ss[j] = (A * ss[j - 1] + B * ss[j - 2]) % M
  #   # if ss[j] % M == 0
  #   #   pp(x:, y:, j:, ss:) if $debug
  #   # end

  #   return false if ss[j] == 0
  # end
  true
end

as = [1, 0]
bs = [0, 1]
(2..(M + M)).each do |j|
  as[j] = (A * as[j - 1] + B * as[j - 2]) % M
  bs[j] = (A * bs[j - 1] + B * bs[j - 2]) % M
end

ans = 0
(1...M).each do |x|
  (1...M).each do |y|
    ans += 1 if check(x, y, as, bs)
  end
end


puts ans
