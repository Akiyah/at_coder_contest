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


N = STDIN.gets.chomp.to_i
HS = STDIN.gets.chomp.split.map(&:to_i)

r = 1


def count_length(hs, start, step)
  r = 1
  r_max = 1
  h_last = hs[start]
  i = start + step
  while i < N
    if hs[i] == h_last
      r += 1
      r_max = [r_max, r].max
    else
      r = 1
    end
    pp ['i:', i, 'r:', r] if $debug
    h_last = hs[i]
    i += step
  end
  r_max
end

r_max = 1
(1...N).each do |step|
  (0...N).each do |start|
    pp [start, step] if $debug
    r = count_length(HS, start, step)
    pp [start, step, r] if $debug
    r_max = [r_max, r].max
  end
end

puts r_max
