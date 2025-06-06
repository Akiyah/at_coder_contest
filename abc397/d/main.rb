#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

require 'prime'
# pd = Prime.prime_division(a)

class Prime
  def each_divisor(n, &block)
    pf = prime_division(n)
    num = -> { pf.inject(1) { |prod, (_, exp)| prod * exp.succ } }
    Enumerator.new(num) { |y| __each_divisor__(1, pf, &y.method(:<<)) }
              .tap { |enum| enum.each(&block) }
  end

  private def __each_divisor__(d, ary, &block)
    return yield(d) if ary.empty?

    ary = ary.dup
    prime, exp = ary.pop
    0.upto(exp) { __each_divisor__(d, ary, &block); d *= prime }
  end
end

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i

def calc
  (1..N).each do |m|
    return nil if N < m * (3 + 3 * m + m ** 2)

    next unless N % m == 0
    n = N / m

    d = 9 * m ** 2 - 4 * 3 * (m ** 2 - n)
    next if d < 0

    d2 = Math.sqrt(d).to_i
    next unless d2 ** 2 == d

    y2 = -3 * m + d2
    if 0 < y2 && y2 % 6 == 0
      y = y2 / 6
      pp({m:, y:, y2:, d2:, d:, n:, m2:}) if $debug
      return [y + m, y]
    end
  end
  nil
end

xy = calc

if xy == nil
  puts -1
else
  x, y = xy
  puts "#{x} #{y}"
end
