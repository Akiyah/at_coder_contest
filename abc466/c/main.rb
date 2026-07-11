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
pp(N:) if $debug
STDOUT.flush

def calc
  j = 0
  r = 0

  N.times do |i|
    pp(i:) if $debug
    while true
      pp(j:) if $debug
      if j == i
        j += 1
        if N <= j
          d = N - i
          r += d * (d - 1) / 2
          pp(r:) if $debug
          return r
        end
        next
      end

      puts "? #{i + 1} #{j + 1}"
      STDOUT.flush

      a = STDIN.gets.chomp
      if a == 'Yes'
        j += 1
        if N <= j
          d = N - i
          r += d * (d - 1) / 2
          pp(r:) if $debug
          return r
        end
      else # 'No'
        r += (j - i - 1)
        pp(r:) if $debug
        break
      end
    end
  end

  r
end

r = calc
puts "! #{r}"
