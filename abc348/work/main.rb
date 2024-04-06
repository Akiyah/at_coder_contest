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


def calc_one(enagies, s, t, board_old, foots_old)
  foots = {}
  board = board_old.map(&:dup)

  foots_old.each do |f_key, e|
    r, c = f_key

    [[r - 1, c], [r + 1, c], [r, c - 1], [r, c + 1]].each do |r2, c2|
      next if r2 < 1 || H < r2 || c2 < 1 || W < c2

      eb = board[(r2- 1) * W + (c2 - 1)]
      next if eb == false

      e2 = e - 1
      # ex = enagies[r2][c2]
      ex = enagies&.at(r2)&.at(c2)
      if ex != nil
        e2 = [e2, ex].max
      end

      next if e2 < 0

      #if board[r2 - 1][c2 - 1] != nil
      if eb != nil
        if e2 <= eb
          next
        end
      end

      if foots[[r2, c2]] != nil
        if e2 <= foots[[r2, c2]]
          next
        end
      end

      # board[r2 - 1][c2 - 1] = e2
      board[(r2- 1) * W + (c2 - 1)] = e2

      foots[[r2, c2]] = e2
    end
  end

  return board, foots, true if foots[t] != nil

  return board, foots, false if foots.size == 0

  return board, foots, nil
end


def calc()
  enagies = []
  RCES.each do |r, c, e|
    enagies[r] ||= []
    enagies[r][c] = e
  end

  s = []
  t = []
  board = AS.map.with_index do |line, r|
    line.map.with_index do |a, c|
      if a == '#'
        false
      else
        s = [r + 1, c + 1] if a == 'S'
        t = [r + 1, c + 1] if a == 'T'
        nil
      end
    end
  end
  board = board.flatten
  
  pp [enagies, s, t, board] if $debug
  

  #e = enagies[s[0]][s[1]]
  e = enagies&.at(s[0])&.at(s[1])
  return false if e == nil

  foots = {}
  foots[s] = e
  board[(s[0]- 1) * W + (s[1] - 1)] = e
  while true
    board, foots, result = calc_one(enagies, s, t, board, foots)
    #pp board if $debug
    pp foots.length if $debug
    return result if result != nil
  end

end


puts calc ? 'Yes' : 'No'
