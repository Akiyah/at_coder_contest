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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def check_plus(n ,as)
  # pp(as:) if $debug
  # 0 < r
  bs = as.sort
  b_0 = bs[0]
  b_1 = bs[1]
  bs.each_cons(2) do |b0, b1|
    return false unless b0 * b_1 == b_0 * b1
  end
end

def check_minus(n ,as)
  pp(as:) if $debug
  # r < 0
  bs = as.select { |a| 0 < a }.sort
  cs = as.select { |a| a < 0 }.sort.reverse

  pp(bs:, cs:) if $debug

  return false if bs.length == 0
  return false if cs.length == 0

  return false if 1 < (bs.length - cs.length).abs

  bs, cs = cs, bs unless bs[0].abs < cs[0].abs # bのほうが小さいものからスタートしている

  if bs[0].abs == cs[0].abs && bs.length < cs.length
    bs, cs = cs, bs
  end

  pp(bs:, cs:) if $debug

  return false if bs.length < cs.length

  if bs.length == cs.length
    l = cs.length
    b0 = bs[0]
    c0 = cs[0]
    (0...(l - 1)).each do |i|
      return false unless cs[i] * b0 == bs[i] * c0
      return false unless bs[i + 1] * b0 == cs[i] * c0
    end
    return false unless cs[l - 1] * b0 == bs[l - 1] * c0
    # return false unless bs[l] * b0 == cs[l - 1] * c0
    return true
  else # csが一つ短い
    l = cs.length
    b0 = bs[0]
    c0 = cs[0]
    (0...(l - 1)).each do |i|
      return false unless cs[i] * b0 == bs[i] * c0
      return false unless bs[i + 1] * b0 == cs[i] * c0
    end
    return false unless cs[l - 1] * b0 == bs[l - 1] * c0
    return false unless bs[l] * b0 == cs[l - 1] * c0

    return true
  end

end

def calc
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)

  return true if n == 2

  check_plus(n ,as) || check_minus(n ,as)
end



T.times do
  puts calc ? 'Yes' : 'No'
end

