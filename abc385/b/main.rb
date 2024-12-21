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

H, W, X, Y = STDIN.gets.chomp.split.map(&:to_i)

SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

pp SS if $debug

T = STDIN.gets.chomp.split('')

homes = []
x, y = X, Y
T.each do |t|
  puts t if $debug
  if t == 'U'
    unless SS[x - 1 - 1][y - 1] == '#'
      x = x - 1
    end
  end
  if t == 'D'
    unless SS[x - 1 + 1][y - 1] == '#'
      x = x + 1
    end
  end
  if t == 'L'
    unless SS[x - 1][y - 1 - 1] == '#'
      y = y - 1
    end
  end
  if t == 'R'
    unless SS[x - 1][y + 1 - 1] == '#'
      y = y + 1
    end
  end

  pp [x, y, SS[x - 1][y - 1]] if $debug

  if SS[x - 1][y - 1] == '@'
    homes << [x, y]
    pp homes if $debug
  end
end


puts [x, y, homes.uniq.length].join(' ')
