#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
require 'prime'


$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  bs = AS.map do |a|
    Prime.prime_division(a).to_h
  end
  # pp({bs:}) if $debug

  ts = []
  (0...N).to_a.combination(K).map do |js|
    # pp bs
    rs = bs[js[0]].dup
    # pp rs
    js[1..].each do |j|
      rs.each do |p, i|
        if bs[j][p]
          rs[p] = [rs[p], bs[j][p]].min
        else
          rs.delete(p)
        end
      end
      # pp rs
    end
    r = rs.map do |p, i|
      p ** i
    end.inject(:*) || 1
    # pp({js:, rs:, r:}) if $debug
    js.each do |j|
      ts[j] ||= 1
      ts[j] = [ts[j], r].max
    end
  end

  ts
end

ts = calc

ts.each do |i|
  puts i
end
