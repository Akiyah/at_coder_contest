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


N, D = STDIN.gets.chomp.split.map(&:to_i)
TLS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



(1..D).each do |k|
  w = 0
  TLS.each do |t, l|
    if w < t * (l + k)
      w = t * (l + k)
    end
  end
  puts w
end
