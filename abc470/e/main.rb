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


$v = Array.new(N + 1) { Array.new(N + 1) { Array.new(L + 1, 0) } } # $v[n][m][l], $v[0-N][0-N][0-L]
def get_v(n, m, l)
  return 0 if l == 0
  return 0 if N < n
  return n if m == 0

  $v[n][m][l]
end
def set_v(n, m, l, v)
  $v[n][m][l] = v
end


def calc
  (1..N).each do |m|
    (1..L).each do |l|
      (0..N).each do |n|
        a = 1.0 * n / (n + 2 * m) * (1 + get_v(n - 1, m, l))
        b1 = 1.0 * (2 * m) / (n + 2 * m) / (n + 2 * m - 1) * (1 + get_v(n, m - 1, l))
        b2 = 1.0 * (2 * m) / (n + 2 * m) * (2 * m - 2) / (n + 2 * m - 1) * get_v(n + 2, m - 2, l - 1)
        if 1 < l
          b3 = 1.0 * (2 * m) / (n + 2 * m) * n / (n + 2 * m - 1) * (1 + get_v(n, m - 1, l - 1))
        else
          b3 = 0
        end
        v = a + b1 + b2 + b3
        set_v(n, m, l, v)
      end
    end
  end

  r = get_v(0, N, L)
  r * AS.sum / N
end

r = calc
puts r.to_f


