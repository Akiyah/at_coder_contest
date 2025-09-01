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

RT, CT, RA, CA = STDIN.gets.chomp.split.map(&:to_i)
N, M, L = STDIN.gets.chomp.split.map(&:to_i)
SAS = (1..M).map do
  s, a = STDIN.gets.chomp.split
  [s, a.to_i]
end
TBS = (1..L).map do
  t, b = STDIN.gets.chomp.split
  [t, b.to_i]
end

def calc_one_normal((r, c), s, t, l) # s == 'D', t !== 'L'
  pp(r:, c:, s:, t:, l:) if $debug
  # 同じ方向
  if 'D' == t
    return [0, 0] == [r, c] ? l : 0
  end

  # # 同じスタート地点（で方向が違う）
  # if [0, 0] == [r, c]
  #   return 0
  # end

  # 逆方向
  if t == 'U'
    return 0 unless c == 0
    if (r % 2 == 0) && (0 < r) && (r <= 2 * l)
      return 1
    end
    return 0
  end

  # 直交の場合
  if t == 'R'
    if 0 < r && r <= l
      if (c + r == 0)
        return 1
      end
    end
    return 0
  end
end

def calc_one(ap, bp, s, t, l)
  pp(ap:, bp:, s:, t:, l:) if $debug

  # ap = [0, 0] にする
  bp = [bp[0] - ap[0], bp[1] - ap[1]]

  # s が横方向は縦方向にする  
  if s == 'L'
    bp = [bp[1], bp[0]]
    s = 'U'
    t = if t == 'U'
          'L'
        elsif t == 'D'
          'R'
        elsif t == 'R'
          'D'
        else # t == 'L'
          'U'
        end
  end
  if s == 'R'
    bp = [bp[1], bp[0]]
    s = 'D'
    t = if t == 'U'
          'L'
        elsif t == 'D'
          'R'
        elsif t == 'R'
          'D'
        else # t == 'L'
          'U'
        end
  end

  # s が上方向の場合は下方向にする
  if s == 'U'
    bp = [-bp[0], bp[1]]
    s = 'D'
    t = if t == 'U'
          'D'
        elsif t == 'D'
          'U'
        else
          t
        end
  end

  # t が左方向の場合は右方向にする
  if t == 'L'
    bp = [bp[0], -bp[1]]
    t = 'R'
  end

  calc_one_normal(bp, s, t, l) # s == 'D'
end

def move(ap, s, l)
  if s == 'U'
    [ap[0] - l, ap[1]]
  elsif s == 'D'
    [ap[0] + l, ap[1]]
  elsif s == 'R'
    [ap[0], ap[1] + l]
  else
    [ap[0], ap[1] - l]
  end
end


def calc()
  ap = [RT, CT]
  bp = [RA, CA]

  r = 0
  i = 0
  ja = 0
  jb = 0
  s, a = SAS[ja]
  t, b = TBS[jb]
  pp(i:, ap:, bp:, ja:, jb:, s:, a:, b:, r:) if $debug
  while i < N
    if a < b
      l = a
    else
      l = b
    end
    
    # pp calc_one(ap, bp, s, t, l) if $debug
    r += calc_one(ap, bp, s, t, l)
    ap = move(ap, s, l)
    bp = move(bp, t, l)

    a -= l
    b -= l
    i += l
    if a == 0
      ja += 1
      s, a = SAS[ja]
    end
    if b == 0
      jb += 1
      t, b = TBS[jb]
    end
    pp(i:, ap:, bp:, ja:, jb:, s:, a:, b:, r:) if $debug
  end
  r
end



puts calc


