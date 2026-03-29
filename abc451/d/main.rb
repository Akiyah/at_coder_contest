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


gls = {}
(0..29).each do |i| # 2 ** 30 > 10 ** 9
  n = 2 ** i
  s = n.to_s
  l = s.length
  gls[l] ||= []
  gls[l] << n
end

pp(gls:) if $debug


def create_array(gls)
  rls = {}
  (1..9).each do |i|
    rls[i] ||= []
    rls[i] += gls[i]
    (1...i).each do |j|
      gls[j].product(rls[i - j]) { |a, b| rls[i] << a * (10 ** (i - j)) + b }
    end
  end

  rls.map { |i, rs| rs.uniq.sort }.flatten
end


rs = create_array(gls)
pp(rs: rs[..100]) if $debug

puts rs[N - 1]

