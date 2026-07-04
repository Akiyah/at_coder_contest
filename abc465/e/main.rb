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

MOD = 998244353

N = STDIN.gets.chomp

def create_data
  is = N.chars.map(&:to_i)
  m = is.length # 桁数

  ddp = [] # '3'を含むか、3で割ったあまり、使用文字(1文字、2文字、3文字、4文字以上はnilにする)
  dp0 = {}
  dp0[[true, 0, 0, {}, false]] = 0
  dp0[[true, 1, 0, {}, false]] = 0
  dp0[[true, 2, 0, {}, false]] = 0
  dp0[[false, 0, 0, {}, false]] = 1
  dp0[[false, 1, 0, {}, false]] = 0
  dp0[[false, 2, 0, {}, false]] = 0
  
  ddp[0] = dp0

  (1..m).each do |d|
    dp_old = ddp[d - 1]
    dp = {}
    (0..9).each do |y| # 一番上の桁、0も許容する
      dp_old.each do |(b1_old, b2_old, b3_old, b4_old, b5_old), value|
        b1 = (y == 3) || b1_old
        b2 = (b2_old + y) % 3
        b3 = b3_old
        b4 = b4_old.dup
        b5 = (y == 0)
        if b4
          if !b4[y]
            if b3 < 3
              b3 += 1
              b4[y] = true
            else
              b3 = 4
              b4 = nil
            end
          end
        end
        v = dp[[b1, b2, b3, b4, b5]] || 0
        dp[[b1, b2, b3, b4, b5]] = (v + value) % MOD
      end
    end
    ddp[d] = dp
    pp(dp:) if $debug
  end

  pp(ddp:) if $debug

  ddp


  cs = []
  cs_sum = 0
  cs_include_3 = false
  r = 0
  is.each.with_idnex do |i, d2|
    (0...i).each do |y|
      ddp[m - d2 - 1].each do |(b1, b2, b3, b4, b5), value|
        b = 0
        b += 1 if cs_include_3 || b1
        b += 1 if (y + b2 + cs_sum) % 3 == 0
        b += 1 if (b3 == 3 && b4.include?(y)) 
        

      end


    end
    cs << i
    cs_sum += i
    cs_include_3 = true if i == 3
  end


  # r = 0
  # (1..N).each do |x|
  #   b1 = 0
  #   b2 = 0
  #   b3 = 0
  #   # pp(x:) if $debug
  #   b1 = 1 if x % 3 == 0
  #   cs = x.to_s.chars
  #   # pp(cs:) if $debug
  #   b2 = 1 if cs.include?('3')
  #   ds = cs.tally
  #   pp(ds:) if $debug

  #   b3 = 1 if ds.keys.length == 3

  #   b = ((b1 + b2 + b3) == 1)

  #   r += 1 if b
  #   pp(x:, b: [b1, b2, b3], r:) if $debug
  # end

  # r % MOD
end

data = create_data
pp(data:) if $debug
puts data.length
