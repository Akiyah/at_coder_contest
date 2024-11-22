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
S = STDIN.gets.chomp


def calc
  m1 = 0
  m2 = 0
  last_c = nil
  m_max = 0
  N.times do |i|
    c = S[i]
    if c == '1'
      m2 = 0
      if last_c == '1'
        m1 += 1
      else
        m1 = 1
        m2 = 0
      end
    elsif c == '/'
      m2 = 0
      if last_c == '1'
      else
        m1 = 0
      end
      # m_max = [0, m_max].max
    else # '2'
      if last_c == '2'
        m2 += 1
      elsif last_c == '/'
        m2 = 1
      else
        m1 = 0
        m2 = 0
      end
      if m2 <= m1
        m_max = [m_max, m2].max
      end
    end
    last_c = c
    pp [c, m1, m2, m_max] if $debug
  end

  m_max * 2 + 1
end


puts calc
