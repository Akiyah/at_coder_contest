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


def calc()
  h, w = STDIN.gets.chomp.split.map(&:to_i)
  ss = h.times.map do
    STDIN.gets.chomp.split('')
  end


  r = 0
  (1..h).each do |h0|
    (1..w).each do |w0|
      (0...h).each_cons(h0) do |is|
        (0...w).each_cons(w0) do |js|
          r1 = 0
          r2 = 0
          is.each do |i|
            js.each do |j|
              r1 += 1 if ss[i][j] == '#'
              r2 += 1 if ss[i][j] == '.'
            end
          end
          r += 1 if r1 == r2
        end
      end
    end
  end

  r
end


T.times do
  puts calc()
end