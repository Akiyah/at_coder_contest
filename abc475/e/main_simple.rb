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


N, M, K = STDIN.gets.chomp.split.map(&:to_i)
T = STDIN.gets.chomp
SS = (1..N).map do
  STDIN.gets.chomp
end

Q = STDIN.gets.chomp.to_i

# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

ts = T.chars.map { |c| c == 'o' ? true : false } 
answers = SS.map { |s| s.chars.map { |c| c == 'o' ? true : false } }

def calc(ts, answers, i, j)
  answers[i][j] = !answers[i][j]

  pp(ts:, answers:) if $debug

  uks = (0...N).to_a
  oks = []
  ngs = []
  pp(uks:, oks:, ngs:) if $debug
  K.times do |j|
    oks_ = []
    ngs_ = []
    uks.each do |i|
      if answers[i][j] == ts[j]
        oks_ << i
      else
        ngs_ << i
      end
    end
    if oks.length + oks_.length <= M
      oks += oks_
      uks -= oks_
    else
      ngs += ngs_
      uks -= ngs_
    end
    pp(j:, uks:, oks:, ngs:) if $debug
  end

  oks.include?(i)
end

Q.times do
  i, j = STDIN.gets.chomp.split.map(&:to_i)
  r = calc(ts, answers, i - 1, j - 1)
  puts r ? 'Yes' : 'No'
end

