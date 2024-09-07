# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


H, W, Q = STDIN.gets.chomp.split.map(&:to_i)
RCS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

board_r = (1..H).map do
  [1] * W
end
board_c = (1..W).map do
  [1] * H
end

def find_hl(board_r, board_c, r, c)

  n0 = board_r[r][0...c].reverse.join('').to_i(2)
  pp n0 if $debug
  c0 = n0 == 0 ? nil : n0.to_s(2).length - 1

  n1 = board_r[r][(c + 1)...W].join('').to_i(2)
  pp n1 if $debug
  c1 = n1 == 0 ? nil : W - n1.to_s(2).length

  m0 = board_c[c][0...r].reverse.join('').to_i(2)
  pp m0 if $debug
  r0 = m0 == 0 ? nil : m0.to_s(2).length - 1

  m1 = board_c[c][(r + 1)...H].join('').to_i(2)
  pp m1 if $debug
  r1 = m1 == 0 ? nil : H - m1.to_s(2).length

  [r0, r1, c0, c1]
end


RCS.each do |r1, c1|
  r = r1 - 1
  c = c1 - 1
  pp [r, c] if $debug

  if board_r[r][c] == 0 # すでに壁がない
    r0, r1, c0, c1 = find_hl(board_r, board_c, r, c)
    pp [r0, r1, c0, c1] if $debug


    board_r[r][c0] = 0 if c0
    board_r[r][c1] = 0 if c1
    board_c[c][r0] = 0 if r0
    board_c[c][r1] = 0 if r1

    board_r[r0][c] = 0 if r0
    board_r[r1][c] = 0 if r1
    board_c[c0][r] = 0 if c0
    board_c[c1][r] = 0 if c1
  else # 壁がある
    board_r[r][c] = 0
    board_c[c][r] = 0
  end

  pp board_r if $debug
  pp board_c if $debug
end


r = board_r.map do |line|
  line.count { |i| i == 1}
end.sum
puts r

