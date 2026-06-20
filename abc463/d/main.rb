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

N, K = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def can_score(lrs, score)
  c = 1
  last_l, last_r = lrs[0]
  lrs[1..].each do |l, r|
    if l < last_r + score # 重なっているので、枚数は増えない
      if r < last_r
        last_r = r # 短い方を採用し直す
      end
    else # 枚数がふえる
      c += 1
      return true if K <= c
      last_l = l
      last_r = r
    end
  end

  false
end



def calc
  lrs = LRS.sort_by { |l, r| l }
  
  r = (0..(10**9)).bsearch { |score| !can_score(lrs, score) }
  pp(r:) if $debug

  if r == 1
    return -1
  else
    return r - 1
  end

end


puts calc
