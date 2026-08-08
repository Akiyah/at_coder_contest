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

N, L = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc(as)
  i = 0
  score = 0
  bs = {}
  l = L

  while true
    # pp(i:, score:) if $debug
    a1 = as[i]
    if bs[a1]
      score += a1 # もう一個めくって点数を取得する
      i += 1
    else
      bs[a1] = true

      a2 = as[i + 1]
      if a2 == a1 # めくった二枚が一致した
        score += a1 # 点数を取得する
      else
        l -= 1
        return score if l == 0
        
        if bs[a2] # 次にスコアを取得する
          score += a2 # 点数を取得する
        end
        bs[a2] = true
      end

      i += 2
    end

    return score if N * 2 <= i
  end
end



s = 0
n = 0
(AS + AS).permutation(N * 2).each do |as|
  pp(as:) if $debug
  score = calc(as)
  pp(score:) if $debug

  s += score
  n += 1
  pp(s:, n:) if $debug
end

puts s.to_f / n


