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


def calc(i, j, useds, d)
  pp ('  ' * d + {i:, j:, d:}.to_s) if $debug
  rs = []
  (i...N).each do |i2|
    next if useds[i2]
    j2 = (j...N).bsearch { |j_| AS[i2] * 2 <= AS[j_] }
    break unless j2

    (j2...N).each do |j3|
      useds[j3] = true
      rs << 1 + calc(i2 + 1, j3 + 1, useds, d + 1)
      useds[j3] = false
    end
  end

  if rs.length == 0
    pp ('  ' * d + {i:, j:, d:}.to_s + ", 0") if $debug
    return 0
  end

  pp ('  ' * d + {i:, j:, d:}.to_s + ", #{rs.max}") if $debug
  rs.max
end

puts calc(0, 1, [], 0)
