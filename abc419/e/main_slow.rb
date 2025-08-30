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

N, M, L = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def create_xs(xs_short)
  xs = xs_short + Array.new(N - L)

  xs[L - 1] = (-xs[0...(L - 1)].sum - AS[0...L].sum) % M

  (L...N).each do |i|
    xs[i] = (xs[i - L] + AS[i -  L] - AS[i]) % M
  end

  xs
end


def calc()
  ms = (0...M).to_a
  xs_shorts = ms.product(*([ms] * (L - 2)))
  pp(xs_shorts:) if $debug

  cs = xs_shorts.map do |xs_short|
    xs = create_xs(xs_short)

    c = xs.map { |x| x % M }.sum
    pp(xs_short: ,xs:, c:) if $debug
    c
  end

  # pp(cs:) if $debug
  cs.min
end



puts calc()






