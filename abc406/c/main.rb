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

N = STDIN.gets.chomp.to_i
PS = STDIN.gets.chomp.split.map(&:to_i)


def calc()
  a0 = PS[0]
  a1 = PS[1]

  last_d_up = (a0 < a1)
  last_a = a1
  up_count = ((a0 < a1) ? 1 : 0)
  up_count_1 = 0
  r = 0
  PS[2..].each.with_index do |a, i|
    d_up = (last_a < a)

    if last_d_up == d_up # 同じ方向
      pp '==' if $debug
      if d_up # 上に向かっている
        pp 'up' if $debug
        up_count += 1
      end
    else # 向きが変わった
      pp '!=' if $debug
      if d_up # 上に向かっている
        pp 'up' if $debug
        up_count = 1
      else # 下に向かっている
        pp 'down' if $debug
        r += (up_count * up_count_1)

        up_count_1 = up_count
      end
    end

    pp({a:, last_a:, r:, d_up:, last_d_up:, up_count:, up_count_1:}) if $debug
    last_d_up = d_up
    last_a = a
  end

  if last_d_up # 最後が上向きだった場合
    r += (up_count * up_count_1)
  end

  r
end




puts calc()


