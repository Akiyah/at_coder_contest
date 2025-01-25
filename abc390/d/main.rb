#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc1(as)
  n = as.length
  pp n if $debug

  if n == 1
    return as
  end

  rs = []
  # as[0] が単独の場合
  rs += calc1(as[1..]).map { |r| r ^ as[0] }
  
  # as[0] が単独じゃない場合
  (1...n).each do |i|
    as2 = as[1..]
    # next if (as2[i - 1] + as[0]) == (as2[i - 1] ^ as[0])
    as2[i - 1] += as[0]
    rs += calc1(as2)
  end

  rs.uniq
end

def calc(as)
  calc1(as).size
end

puts calc(AS)

