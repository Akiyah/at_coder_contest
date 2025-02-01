#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

def calc1(as)
  if as.length == 1
    return as
#    return as.inject(0) {|result, item| result ^ item }
  end

  rs = []
  rs << as.inject(0) {|result, item| result ^ item }
  n = as.length
  (0...n).to_a.permutation(2).each do |i, j|
    as2 = as.dup
    as2[j] += as2[i]
    as2 = as2[...i] + as2[(i+1)..]
    rs += calc1(as2)
  end

  rs.uniq
end

def calc(as)
  calc1(as).size
end


results = {}
N = 50
pp (0..N).to_a.combination(3).to_a.length
(0..N).to_a.combination(3).each do |as|
  # pp as
  r = calc1(as).size
  results[r] ||= []
  results[r] << as
  if r == 5
    pp [as, as.map{|i|i.to_s(2)}]
  end
end

pp results.map { |k, v| [k, v.length] }
