#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split('').map(&:to_i)


def step(as)
  bs = []
  as.each_slice(3) do |(a0, i0), (a1, i1), (a2, i2)|
    a_sum = a0 + a1 + a2
    if a_sum == 0
      bs << [0, [i0, i1, i2].min(2).sum]
    elsif a_sum == 1
      if a0 == 1
        bs << [0, [i1, i2].min]
      elsif a1 == 1
        bs << [0, [i0, i2].min]
      else
        bs << [0, [i0, i1].min]
      end
    elsif a_sum == 2
      if a0 == 0
        bs << [1, [i1, i2].min]
      elsif a1 == 0
        bs << [1, [i0, i2].min]
      else
        bs << [1, [i0, i1].min]
      end
    else # 3
      bs << [1, [i0, i1, i2].min(2).sum]
    end
  end
  bs
end

as = AS.map { |a| [a, 1] }
pp as if $debug

N.times do |i|
  as = step(as)
  pp as if $debug
end

puts as[0][1]

