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

K = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp
T = STDIN.gets.chomp




def check_1(ss, ts)
  l = ss.length
  d = 0
  (0...l).each do |i|
    if ss[i] != ts[i + d]
      if d != 0
        return false
      else
        d = -1
      end
    end
  end

  return true
end


def calc()
  ss = S.split('')
  ts = T.split('')

  return true if ss == ts

  if ss.length == ts.length
    l = ss.length
    if (0...l).select { |i| ss[i] != ts[i] }.length == 1
      return true
    end
  end

  if ss.length == ts.length + 1
    return check_1(ss, ts)
  end

  if ss.length + 1 == ts.length
    return check_1(ts, ss)
  end

  return false
end


puts calc() ? 'Yes' : 'No'

