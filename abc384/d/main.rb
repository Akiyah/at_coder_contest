#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N, S = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc(s)
  pp AS if $debug
  pp [S, s] if $debug

  bs = [0]
  cs = [0]
  AS.map { |a| bs << bs[-1] + a }
  AS.reverse.map { |a| cs << cs[-1] + a }

  pp bs if $debug
  pp cs if $debug

  (0..N).each do |i|
    t = s - cs[i]
    pp ['i', i, s, cs[i], t] if $debug
    next if t < 0
    j = bs.bsearch_index{|b| t <= b}
    next if j == nil
    pp ['j', j, bs[j]] if $debug
    return true if s == cs[i] + bs[j]
  end

  false
end


as_sum = AS.sum
s0 = S % as_sum
s1 = as_sum + (S % as_sum)


puts (calc(s0) || calc(s1)) ? 'Yes' : 'No'
