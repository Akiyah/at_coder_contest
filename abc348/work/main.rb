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

def create_enagies
  enagies = (1..H).map do |r|
    (1..W).map do |c|
      -1
    end
  end
  
  RCES.each do |r, c, e|
    enagies[r - 1][c - 1] = e
  end
  enagies
end

def create_board
  s = nil
  t = nil
  board = AS.map.with_index do |line, r|
    line.map.with_index do |a, c|
      if a == '#'
        false
      else
        s = [r, c] if a == 'S'
        t = [r, c] if a == 'T'
        -1
      end
    end
  end
  [board, s, t]
end

def calc_one(enagies, s, t, board, foots)
  max = foots.keys.max
  max_foots = foots[max]
  foots.delete(max)

  max_foots.each do |r, c|
    return true if [r, c] == t # goal
    next unless board[r][c] # '#'

    e = [max, enagies[r][c]].max
    next if e <= board[r][c]
    next if e <= 0
    board[r][c] = e
    
    foots[e - 1] ||= []
    foots[e - 1] << [r - 1, c] if 0 <= r - 1
    foots[e - 1] << [r + 1, c] if r + 1 < H
    foots[e - 1] << [r, c - 1] if 0 <= c - 1
    foots[e - 1] << [r, c + 1] if c + 1 < W
  end

  return false if foots.size == 0
  return nil
end

def board_to_s(board)
  s = ''
  board.each do |line|
    line.each do |a|
      if a == false
        s += '#'
      elsif a == -1
        s += '.'
      else
        s += a.to_s
      end
    end
    s += "\n"
  end
  s
end

def enagies_to_s(enagies)
  s = ''
  enagies.each do |line|
    line.each do |a|
      if a == -1
        s += ' '
      else
        s += a.to_s
      end
    end
    s += "\n"
  end
  s
end

def calc
  enagies = create_enagies
  board, s, t = create_board

  puts board_to_s(board) if $debug
  puts enagies_to_s(enagies) if $debug
  pp s if $debug
  pp t if $debug
  
  
  foots = {}
  foots[0] = [s]
  board[s[0]][s[1]] = 0
  while true
    pp "-" * 100 if $debug
    pp foots if $debug
    puts board_to_s(board) if $debug
    puts enagies_to_s(enagies) if $debug
    result = calc_one(enagies, s, t, board, foots)
    return result if result != nil
  end
end

puts calc ? 'Yes' : 'No'
