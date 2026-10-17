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

N = STDIN.gets.chomp.to_i

def calc_3()
  r = 0

  a = 1
  while true
    pp(a:) if $debug && a % 1000 == 0
    x1 = (8 * N - a ** 3)
    # pp(x1:) if $debug
    return r unless 0 <= x1
    
    x2 = (x1 * a) ** 0.5 - 3 * (a ** 2)
    # pp(x2:) if $debug
    return r unless 0 <= x2

    d_max = (x2 / (4 * a)).floor
    # pp(d_max:) if $debug
    return r unless 1 <= d_max

    r += d_max
    # pp(d_max:, r:) if $debug

    a += 1
  end
end


def calc_over_3()
  r = 0

  d = 1
  while true
    pp(d:) if $debug && d % 1000 == 0
    return r unless d * (2 * d) * (3 * d) <= N

    (1...d).each do |a1|
      s = a1 * (a1 + d) * (a1 + 2 * d) * (a1 + 3 * d)
      if N < s
        break
      end

      i = 4
      while N < s * (a1 + i * d)
        s *= (a1 + i * d)
        i += 1
      end

      



    end
    



    x2 = (x1 * a) ** 0.5 - 3 * (a ** 2)
    # pp(x2:) if $debug
    return r unless 0 <= x2

    d_max = (x2 / (4 * a)).floor
    # pp(d_max:) if $debug
    return r unless 1 <= d_max

    r += d_max
    # pp(d_max:, r:) if $debug

    d += 1
  end
end


r_3 = calc_3()
pp(r_3:) if $debug
r_over_3 = calc_over_3()

puts r_3 + r_over_3

