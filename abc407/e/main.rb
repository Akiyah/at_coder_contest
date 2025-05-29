#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc(n, as)
  paires = (0...(2 * n - 1)).map do |i|
    { i:, j: i + 1, d: as[i] - as[i + 1], enable: true, prev: nil, next: nil }
  end
  paires.each_cons(2) { |pair1, pair2| pair1[:next] = pair2; pair2[:prev] = pair1 }
  pq = AcLibraryRb::PriorityQueue.new(paires) do |pair1, pair2|
    pair1[:d] > pair2[:d]
  end
  # is = Array.new(2 * n, true)
  co = 0
  r = 0

  pp(co:, r:) if $debug

  if $debug
    pp paires.map { |pair| [pair[:i], pair[:j], pair[:d], pair[:enable], pair[:prev] != nil, pair[:next] != nil] }
  end

  while co < n
    pair = pq.pop
    pp(co:, n:, r:, i: pair[:i], j: pair[:j]) if $debug
    next unless pair[:enable]

    co += 1
    r += as[pair[:i]]

    if pair[:prev] && pair[:next]
      pq.push(
        {
          i: pair[:prev][:i],
          j: pair[:next][:j],
          d: pair[:prev][:d] + pair[:d] + pair[:next][:d],
          enable: true,
          prev: pair[:prev][:prev],
          next: pair[:next][:next],
        }
      )
    end
    pair[:prev][:enable] = false if pair[:prev]
    pair[:next][:enable] = false if pair[:next]

    if $debug
      pp paires.map { |pair| [pair[:i], pair[:j], pair[:d], pair[:enable], pair[:prev] != nil, pair[:next] != nil] }
    end
  end

  r
end


T.times do |t|
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  pp(t:, n:, as:) if $debug
  puts calc(n, as)
end


