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

N, M = STDIN.gets.chomp.split.map(&:to_i)

ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


exists = {}

c = 0
ABS.each do |a1, b1|
  a = a1 - 1
  b = b1 - 1
  
  exists[a] ||= {}
  unless exists[a][b]
    exists[a][b] = true
    c += 1
  end

  if a + 2 < N
    exists[a + 2] ||= {}
    if b + 1 < N
      unless exists[a + 2][b + 1]
        exists[a + 2][b + 1] = true
        c += 1
      end
    end
    if 0 <= b - 1
      unless exists[a + 2][b - 1]
        exists[a + 2][b - 1] = true
        c += 1
      end
    end
  end

  if a + 1 < N
    exists[a + 1] ||= {}
    if b + 2 < N
      unless exists[a + 1][b + 2]
        exists[a + 1][b + 2] = true
        c += 1
      end
    end
    if 0 <= b - 2
      unless exists[a + 1][b - 2]
        exists[a + 1][b - 2] = true
        c += 1
      end
    end
  end

  if 0 <= a - 1
    exists[a - 1] ||= {}
    if b + 2 < N
      unless exists[a - 1][b + 2]
        exists[a - 1][b + 2] = true
        c += 1
      end
    end
    if 0 <= b - 2 
      unless exists[a - 1][b - 2]
        exists[a - 1][b - 2] = true
        c += 1
      end
    end
  end

  if 0 <= a - 2
    exists[a - 2] ||= {}
    if b + 1 < N 
      unless exists[a - 2][b + 1]
        exists[a - 2][b + 1] = true
        c += 1
      end
    end
    if 0 <= b - 1
      unless  exists[a - 2][b - 1]
        exists[a - 2][b - 1] = true
        c += 1
      end
    end
  end
end

pp exists if $debug
puts (N * N) - c

