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
  pp bs if $debug
  h = bs.group_by { |b| b }.select { |b, cs| 1 < cs.length }
  pp h if $debug
  if h.length == 0
    # pp 'return bs.length'
    # pp bs.length
    return bs.length
  else
    # s = bs.join('')
    m = 0
    h.each { |b, cs|
      x = 0
      cs = []
      y = bs[x..].find_index(b)
      while y
        cs << y
        x += (y + 1)
        y = bs[x..].find_index(b)
      end


      m1 = (0...(cs.length - 1)).map { |i| cs[i] + 1 + cs[i + 1] }.max 
      # pp ['m1', m1]
      m = [m, m1].max
    }
    # pp 'return m'
    # pp m
    return m
  end

  # pp 'xxxxx'
end


def calc2(as)
  n = as.length
  pp [as, n] if $debug
  m_max = 0
  bs = []
  (0...(n / 2)).each do |i|
    pp [i, as[i * 2], as[i * 2 + 1], bs] if $debug
    if as[i * 2] == as[i * 2 + 1]
      bs << as[i * 2]
    else
      m = calc_one(bs)
      m_max = [m_max, m].max
      bs = []
    end
  end

  m = calc_one(bs)
  pp [m, m_max] if $debug
  m_max = [m_max, m].max

  pp m_max if $debug
  m_max
end

def calc(n, as)
  m1 = calc2(as)
  m2 = calc2(as[1..])
  pp [m1, m2] if $debug
  m = [m1, m2].max
  m * 2
end

puts calc(N, AS)
