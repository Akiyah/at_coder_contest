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
AS = STDIN.gets.chomp.split.map(&:to_i)


as = (AS + [0]).uniq.sort

j = nil
as.each.with_index do |a, i|
  j = i if a == 0
end

pp(as:, j:) if $debug


def calc(as, j)
  r = 0
  n = as.length
  while 2 < n
    pp(as:, j:, r:, n:) if $debug
    a = as[j]

    if 0 < j && j + 1 < n
      al = as[j - 1]
      ar = as[j + 1]
      as.delete_at(j)
      n = n - 1
      # pp([a - al, ar - a])
      if a - al <= ar - a
        r += a - al
        j -= 1
      else #
        r += ar - a
      end
    else
      if j == 0
        r += as[1] - a

        as.delete_at(j)
        n = n - 1

        j -= 1
      else
        r += a - as[n - 2]

        as.delete_at(j)
        n = n - 1
      end
    end
  end

  pp(as:, j:, r:, n:) if $debug


  r += (as[0] - as[1]).abs

  r
end


puts calc(as, j)
