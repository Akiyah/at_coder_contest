#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i



def route(n, a, b)
  r = []
  if a % 2 == 0
    a2 = a / 2
    (0...a2).each do |i|
      r << 'R' * (n - 1) + 'D'
      r << 'L' * (n - 1) + 'D'
    end
    pp(r:) if $debug

    b2 = b / 2
    r << 'DRUR' * b2
    r << 'DRR'
    r << 'URDR' * ((n / 2) - b2 - 1) if 0 < ((n / 2) - b2 - 1)
    pp(r:) if $debug
    r[-1] = r[-1][0...-1] + 'D'
    pp(r:) if $debug

    ((a2 + 1)...(n / 2)).each do |i|
      r << 'L' * (n - 1) + 'D'
      r << 'R' * (n - 1) + 'D'
    end
    pp(r:) if $debug
  else # b % 2 == 0
    b2 = b / 2
    (0...b2).each do |i|
      r << 'D' * (n - 1) + 'R'
      r << 'U' * (n - 1) + 'R'
    end

    a2 = a / 2
    r << 'RDLD' * a2
    r << 'RDD'
    r << 'LDRD' * ((n / 2) - a2 - 1) if 0 < ((n / 2) - a2 - 1)
    r[-1] = r[-1][0...-1] + 'R'

    ((b2 + 1)...(n / 2)).each do |i|
      r << 'U' * (n - 1) + 'R'
      r << 'D' * (n - 1) + 'R'
    end
  end
  r.join('')[0...-1]
end


def calc(n, a, b)
  if n % 2 != 0
    return false, nil
  end

  if (a + b) % 2 == 0
    return false, nil
  end

  return true, route(n, a, b)

end



T.times do
  n, a, b = STDIN.gets.chomp.split.map(&:to_i)
  r, s = calc(n, a - 1, b - 1)
  if r
    puts 'Yes'
    puts s
  else
    puts 'No'
  end
end

