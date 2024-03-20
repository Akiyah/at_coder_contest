# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, H, W = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map { STDIN.gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
# pp ABS

Z_FULL = 2 ** (H * W) - 1

XS = (0..H).map do |a|
  (0..W).map do |b|
    (0...a).sum do |i|
      (2 ** b - 1) << i * W
    end
  end
end

def f(z)
  z2a(z).map(&:join)
end

def z2a(z)
  z_a = z.to_s(2).split('').map { |x| x.to_i == 1 }.reverse
  z_a += [false] * (H * W - z_a.length)
  z_a = z_a.each_slice(W).to_a
end

def a2z(a)
  a.flatten.reverse.map {|b| b ? 1 : 0}.join.to_i(2)
end

def shadow_left1(z)
  s = ((1 << (H * W)) - 1) / ((1 << W) - 1)
  mask = ((1 << W) - 1 - 1) * s
  border = (1 << (W - 1)) * s
  ((z & mask) >> 1) + border
end

def shadow_left(z, b)
  z2 = z
  (0...b).each do
    z2 |= shadow_left1(z2)
  end
  z2
end

def shadow_up1(z)
  (z >> W) + (((1 << W) - 1) << (H - 1) * W)
end

def shadow_up(z, a)
  z2 = z
  (0...a).each do
    z2 |= shadow_up1(z2)
  end
  z2
end

def shadow(z, a, b)
  z2 = z
  z2 = shadow_up(z2, a - 1)
  z2 = shadow_left(z2, b - 1)
  z2
end

def check_a_b(a, b, abs, z)
  x = XS[a][b]

  z2 = shadow(z, a, b)

  z_a = z2a(z2)

  z_a.flatten.each_with_index do |z_ak, k|
    next if z_ak

    y = (x << k)
    # pp ['(y & z) != 0', f(z), f(x), f(y), f(y & z), k, a, b] if (y & z) != 0
    # pp ['y | z == z', f(z), f(x), f(y), f(y | z), k, a, b] if y | z == z
    #if (y & z) == 0
    r, tiles = check_abs(abs, (y | z))
    if r
      i = k / W
      j = k % W
      return [true, [[a, b, i, j]] + tiles]
    end
    #end
  end
  [false, nil]
end

def check_abs(abs, z)
  # pp ['check_ab', abs, z.to_s(2)]
  return [true, []] if z == Z_FULL
  return [false, nil] if abs.empty?

  a, b = abs[0]

  # 回転なし
  r, tiles = check_a_b(a, b, abs[1..-1], z)
  if r
    return [true, tiles]
  end

  # 回転あり(bとaを入れ替える)
  if a != b
    r, tiles = check_a_b(b, a, abs[1..-1], z)
    if r
      return [true, tiles]
    end
  end

  [false, nil]
end

def check
  (1..N).each do |n|
    ABS.combination(n).each do |abs|
      if abs.sum { |a, b| a * b } == H * W
        board = (1..H).map { Array.new(W, 0) }
        r, tiles = check_abs(abs, 0)
        if r
          return [true, tiles]
        end
      end
    end
  end
  [false, nil, nil]
end

r, tiles = check

if r && $debug
  pp tiles

  bgcolors = [40, 41, 42, 43, 44, 45, 46, 47]

  board = (1..H).map { Array.new(W, 0) }
  tiles.each_with_index do |abij, k|
    a, b, i, j = abij
    (0...a).each do |i2|
      (0...b).each do |j2|
        board[i + i2][j + j2] = k
      end
    end
  end
  board.each do |line|
    puts line.map { |k| "\e[#{bgcolors[k]}m#{k}" }.join + "\e[0m"
  end
end

puts r ? 'Yes' : 'No'
