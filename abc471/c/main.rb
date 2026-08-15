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


def calc
  as_minus = AS.select { |a| a < 0 }.uniq.sort
  as_plus = AS.select { |a| 0 < a }.uniq.sort

  a = 0
  r = 0
  n_minus = as_minus.length
  n_plus = as_plus.length

  while true
    pp(a:, r:, n_minus:, n_plus:, as_minus:, as_plus:) if $debug

    if n_plus == 0
      r += (a - as_minus[0])
      return r
    end
    if n_minus == 0
      r += (as_plus[-1] - a)
      return r
    end


    al = as_minus[-1]
    ar = as_plus[0]
    pp(al:, ar:, dl: a - al, dr: ar - a) if $debug

    if a - al <= ar - a
      as_minus.pop
      n_minus -= 1
      r += a - al
      a = al
    else #
      as_plus.shift
      n_plus -= 1
      r += ar - a
      a = ar
    end
  end

  r
end


puts calc
