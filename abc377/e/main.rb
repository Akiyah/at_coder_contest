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
PS = STDIN.gets.chomp.split.map(&:to_i)
PS0 = PS.map { |p| p - 1 }


def multi(ps1, ps2)
  ps1.map { |pi| ps2[pi] }
end


qss = []
rs = (0...N).to_a
K.to_s(2).split('').reverse.each_with_index do |k, i|
  pp [k, i]
  if i == 0
    qss[i] = PS0
  else
    qss[i] = multi(qss[i - 1], qss[i - 1])
  end

  if k == '1'
    rs = multi(qss[i], rs)
  end
end


puts rs.map {|r| r + 1}.join(' ')
