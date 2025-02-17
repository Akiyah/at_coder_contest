#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
require 'prime'


$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def divisions(a)
  return [1] if a == 1

  pd = Prime.prime_division(a)
  pp({a:, pd:}) if $debug

  ps = pd.map { |p, i| p }
  js = pd.map do |p, i|
    (0..i).to_a
  end
  iss = js[0].product(*js[1..])

  iss.map do |is|
    ps.zip(is).map { |p, i| p ** i }.inject(:*)
  end
end

def calc
  # pq = AcLibraryRb::PriorityQueue.new
  data = {}
  AS.each do |a|
    divisions(a).each do |a2|
      data[a2] = (data[a2] || 0) + 1
    end
  end

  pp({data:}) if $debug

  pq = AcLibraryRb::PriorityQueue.new(data.keys) {|x, y| x < y }
  data2 = {}
  while !pq.empty?
    a = pq.pop
    if K <= data[a]
      data2[a] = a
    else
      pd = Prime.prime_division(a)
      data2[a] = pd.map do |p, i|
        data2[a / p]
      end.max
    end
  end

  pp({data2:}) if $debug

  AS.map do |a|
    data2[a]
  end
end

ts = calc

ts.each do |i|
  puts i
end
