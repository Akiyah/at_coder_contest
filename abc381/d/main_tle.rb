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
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc_one(bs)
  pairs = []
  positions = []

  n = bs.length
  bs.zip(0...n).reverse.each do |b, i|
    j = positions[b]
    if j
      pairs << [i, j]
    end
    positions[b] = i
  end

  m_max = 0
  j_last = n
  pairs.each do |i, j|
    next if j_last <= j

    m = j_last - i - 1
    m_max = m if m_max < m

    j_last = j
  end

  m_max = j_last if m_max < j_last

  m_max
end


def calc2(as)
  n = as.length
  m_max = 0
  bs = []
  (0...(n / 2)).each do |i|
    if as[i * 2] == as[i * 2 + 1]
      bs << as[i * 2]
    else
      m = calc_one(bs)
      m_max = m if m_max < m
      bs = []
    end
  end

  m = calc_one(bs)
  m_max = [m_max, m].max

  m_max
end

def calc(n, as)
  m1 = calc2(as)
  m2 = calc2(as[1..])
  m = [m1, m2].max
  m * 2
end

puts calc(N, AS)
