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

rs = []
def calc(rs, as, d)
  pp [as, d] if $debug

  if as.length == N
    #puts as.join(' ')
    rs << as
  else
    a = as[-1]


    return if M < (a + 10) 

    ((a + 10)..M).each do |b|
      return if 9 < d + (b - (a + 10))
      calc(rs, as + [b], d + (b - (a + 10)))
    end
  end

end

(1..M).each do |a|
  calc(rs, [a], a - 1)
end

puts rs.length
rs.each do |as|
  puts as.join(' ')
end
