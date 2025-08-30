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

def calc_one(ap, bp, s, t, l)
  pp(ap:, bp:, s:, t:, l:) if $debug
  # 同じ方向
  if s == t
    return ap == bp ? l : 0
  end

  # 同じスタート地点（で方向が違う）
  if ap == bp
    return 0
  end

  # 逆方向
  if (s == 'U') && (t == 'D')
    return 0 unless ap[1] == bp[1]
    if ((ap[0] - bp[0]) % 2 == 0) && (0 < (ap[0] - bp[0])) && ((ap[0] - bp[0]) <= 2 * l)
      return 1
    end
    return 0
  end
  if (s == 'D') && (t == 'U')
    return 0 unless ap[1] == bp[1]
    if ((ap[0] - bp[0]) % 2 == 0) && (0 < (bp[0] - ap[0])) && ((bp[0] - ap[0]) <= 2 * l)
      return 1
    end
    return 0
  end
  if (s == 'L') && (t == 'R')
    return 0 unless ap[0] == bp[0]
    if ((ap[1] - bp[1]) % 2 == 0) && (0 < (ap[1] - bp[1])) && ((ap[1] - bp[1]) <= 2 * l)
      return 1
    end
    return 0
  end
  if (s == 'R') && (t == 'L')
    return 0 unless ap[0] == bp[0]
    if ((ap[1] - bp[1]) % 2 == 0) && (0 < (bp[1] - ap[1])) && ((bp[1] - ap[1]) <= 2 * l)
      return 1
    end
    return 0
  end

  # 直交の場合
  if (s == 'D') && (t == 'R')
    d = (bp[0] - ap[0])
    if 0 < d && d <= l
      if (bp[1] + d == ap[1])
        return 1
      end
    end
    return 0
  end
  if (s == 'D') && (t == 'L')
    d = (bp[0] - ap[0])
    if 0 < d && d <= l
      if (bp[1] - d == ap[1])
        return 1
      end
    end
    return 0
  end
  if (s == 'U') && (t == 'R')
    d = (ap[0] - bp[0])
    if 0 < d && d <= l
      if (bp[1] + d == ap[1])
        return 1
      end
    end
    return 0
  end
  if (s == 'U') && (t == 'L')
    d = (ap[0] - bp[0])
    if 0 < d && d <= l
      if (bp[1] - d == ap[1])
        return 1
      end
    end
    return 0
  end

  if (s == 'R') && (t == 'D')
    d = (bp[1] - ap[1])
    if 0 < d && d <= l
      if (bp[0] + d == ap[0])
        return 1
      end
    end
    return 0
  end
  if (s == 'R') && (t == 'U')
    d = (bp[1] - ap[1])
    if 0 < d && d <= l
      if (bp[0] - d == ap[0])
        return 1
      end
    end
    return 0
  end
  if (s == 'L') && (t == 'D')
    d = (ap[1] - bp[1])
    if 0 < d && d <= l
      if (bp[0] + d == ap[0])
        return 1
      end
    end
    return 0
  end
  if (s == 'L') && (t == 'U')
    d = (ap[1] - bp[1])
    if 0 < d && d <= l
      if (bp[0] - d == ap[0])
        return 1
      end
    end
    return 0
  end


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


