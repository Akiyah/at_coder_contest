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
  positions = []

  n = bs.length
  m_max = 0
  j_last = n
  bs.reverse.each_with_index do |b, k|
    i = n - k - 1
    j = positions[b]
    if j && j < j_last
      m = j_last - i - 1
      m_max = m if m_max < m

      j_last = j
    end
    positions[b] = i
  end

  m_max = j_last if m_max < j_last

  m_max
end


def calc2(d)
  n = AS.length - d
  m_max = 0
  bs = []
  (0...(n / 2)).each do |i|
    a = AS[i * 2 + d]
    if a == AS[i * 2 + d + 1]
      bs << a
    else
      m = calc_one(bs)
      m_max = m if m_max < m
      bs = []
    end
  end

  m = calc_one(bs)
  m_max = m if m_max < m

  m_max
end

def calc
  m1 = calc2(0)
  m2 = calc2(1)
  m = [m1, m2].max
  m * 2
end

puts calc
