# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }

SX, SY = STDIN.gets.chomp.split.map(&:to_i)
TX, TY = STDIN.gets.chomp.split.map(&:to_i)

def count(sx, sy, tx, ty)
  pp [sx, sy, tx, ty] if $debug
  if tx < sx
    sx, sy, tx, ty = tx, ty, sx, sy
  end
  # sx <= tx を仮定できる
  pp [sx, sy, tx, ty] if $debug

  if ty < sy
    ty = sy + (sy - ty)
  end
  # sy <= ty を仮定できる
  pp [sx, sy, tx, ty] if $debug

  if sx < 0
    sx, tx = sx + (sx.abs * 2), tx + (sx.abs * 2)
  end
  # 0 <= sx を仮定できる
  pp [sx, sy, tx, ty] if $debug

  if sy < 0
    sy, ty = sy + (sy.abs * 2), ty + (sy.abs * 2)
  end
  # 0 <= sx を仮定できる
  pp [sx, sy, tx, ty] if $debug

  sy, ty = sy - (sy / 2) * 2, ty - (sy / 2) * 2
  # sy = 0, 1 を仮定できる
  pp [sx, sy, tx, ty] if $debug

  sx, tx = sx - (sx / 2) * 2, tx - (sx / 2) * 2
  # sx = 0, 1 を仮定できる
  pp [sx, sy, tx, ty] if $debug

  if sx == 0 && sy == 0
  elsif sx == 0 && sy == 1
    sx, sy, tx, ty = sx - 1, sy - 1, tx - 1, ty - 1
    sx, tx = sx + 2, tx + 2
    sx -= 1
  elsif sx == 1 && sy == 0
    sx -= 1
  else #  sx == 1 && sy == 1
    sx, sy, tx, ty = sx - 1, sy - 1, tx - 1, ty - 1
  end
  # sx = 0, sy = 0 を仮定できる
  pp [sx, sy, tx, ty] if $debug

  if ty <= tx
    return ty + (tx - ty) / 2
  else
    return ty
  end
end

puts count(SX, SY, TX, TY)


