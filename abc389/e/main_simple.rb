#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)



def calc
  m = M
  rs = Array.new(N, 0)
  while true
    qs = (0...N).map do |i|
      k = rs[i] + 1
      q = PS[i] * (2 * k - 1) 
      [q, i]
    end

    q = qs.min_by {|q| q[0]}
    j = q[1]

    if m < q[0]
      pp rs if $debug
      return rs.sum
    end

    m -= q[0]
    rs[j] += 1
  end
end



puts calc


