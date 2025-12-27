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

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  mis_a = []
  sum = AS[0]
  max_sum = AS[0]
  max_i = 0
  mis_a << [max_sum, max_i]
  (1...N).each do |i|
    sum += AS[i] - BS[i]
    if max_sum < sum
      max_sum = sum
      max_i = i
    end
    mis_a << [max_sum, max_i]
  end

  mis_c = []
  sum = CS[N - 1]
  max_sum = CS[N - 1]
  max_i = 0
  mis_c << [max_sum, max_i]
  (1...N).each do |i|
    sum += CS[N - 1 - i] - BS[N - 1 - i]
    if max_sum < sum
      max_sum = sum
      max_i = i
    end
    mis_c << [max_sum, max_i]
  end

  pp(mis_a:) if $debug
  pp(mis_c:) if $debug

  m = 0
  mia = 0
  mic = 0
  (0..(N - 3)).each do |i|
    ma, ia = mis_a[i]
    mc, ic = mis_c[N - 3 - i]
    pp(i:, ma:, mc:, 'ma + mc' => ma + mc) if $debug
    if m < ma + mc
      m = ma + mc
      mia = ia
      mic = ic
      pp(m:, mia:, mic:) if $debug
    end
  end

  pp(m:, mia:, mic:) if $debug
  pp(AS[0..mia]) if $debug
  pp(BS[(mia + 1)...(N - 1 - mic)]) if $debug
  pp(CS[(N - 1 - mic)...]) if $debug

  AS[0..mia].sum + BS[(mia + 1)...(N - 1 - mic)].sum + CS[(N - 1 - mic)...].sum
end


puts calc

