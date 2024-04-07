# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

H, W = STDIN.gets.chomp.split.map(&:to_i)
AS = (1..H).map do
  STDIN.gets.chomp.split('')
end
N = STDIN.gets.chomp.to_i

RCES = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def check(enagies, board, foots, r2, c2, e)
  eb = board[r2 - 1][c2 - 1]
  return unless eb

  e2 = [e - 1, enagies[r2 - 1][c2 - 1]].max

  return if e2 < 0
  return if e2 <= eb

  ef = foots[[r2, c2]]
  if ef != nil
    if e2 <= ef
      return
    end
  end

  board[r2 - 1][c2 - 1] = e2
  foots[[r2, c2]] = e2
end

def calc_one(enagies, s, t, board, foots_old)
  foots = {}

  foots_old.each do |f_key, e|
    r, c = f_key

    check(enagies, board, foots, r - 1, c, e) if 1 <= r - 1
    check(enagies, board, foots, r + 1, c, e) if r + 1 <= H
    check(enagies, board, foots, r, c - 1, e) if 1 <= c - 1
    check(enagies, board, foots, r, c + 1, e) if c + 1 <= W
  end

  return foots, true if foots[t] != nil

  return foots, false if foots.size == 0

  return foots, nil
end


def calc()
  enagies = (1..H).map do |r|
    (1..W).map do |c|
      -1
    end
  end
  
  RCES.each do |r, c, e|
    enagies[r - 1][c - 1] = e
  end
  pp enagies if $debug

  s = []
  t = []
  board = AS.map.with_index do |line, r|
    line.map.with_index do |a, c|
      if a == '#'
        false
      else
        s = [r + 1, c + 1] if a == 'S'
        t = [r + 1, c + 1] if a == 'T'
        -1
      end
    end
  end
  
  pp [enagies, s, t, board] if $debug
  

  ee = enagies[s[0] - 1][s[1] - 1]
  return false if ee < 0

  foots = {}
  foots[s] = ee
  board[s[0]- 1][s[1] - 1] = ee
  while true
    foots, result = calc_one(enagies, s, t, board, foots)
    pp foots if $debug
    return result if result != nil
  end

end


puts calc ? 'Yes' : 'No'
