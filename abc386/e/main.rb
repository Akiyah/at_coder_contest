#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc(z, k, i_max)
  pp [z, k, i_max] if $debug
  if k == 0
    return z
  end

  unless i_max < N - (k - 1)
    return 0
  end

  if k == 1
    return (i_max...(N - k + 1)).map { |i| z ^ AS[i] }.max    
  end

  (i_max...(N - k + 1)).map do |i|
    calc(z ^ AS[i], k - 1, i + 1)
  end.max
end



puts calc(0, K, 0)
