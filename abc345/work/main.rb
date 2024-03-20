# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?
$tiles = []

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

LEFT_S = ((1 << (H * W)) - 1) / ((1 << W) - 1)
LEFT_MASK = ((1 << W) - 1 - 1) * LEFT_S
LEFT_BORDER = (1 << (W - 1)) * LEFT_S

UP_BORDER = ((1 << W) - 1) << (H - 1) * W

def f(z)
  z2a(z).each_slice(W).map { |l| l.map { |b| b ? 1 : 0}.join }.join("\n")
end

def z2a(z)
  z_a = z.to_s(2).split('').map { |x| x.to_i == 1 }.reverse
  z_a += [false] * (H * W - z_a.length)
  # z_a = z_a.each_slice(W).to_a
  z_a
end

def a2z(a)
  a.flatten.reverse.map {|b| b ? 1 : 0}.join.to_i(2)
end

def shadow_left(z, b)
  z2 = z
  (0...b).each do
    z2 |= ((z2 & LEFT_MASK) >> 1) + LEFT_BORDER
    return Z_FULL if z2 == Z_FULL
  end
  z2
end

def shadow_up(z, a)
  z2 = z
  (0...a).each do
    z2 |= (z2 >> W) + UP_BORDER
    return Z_FULL if z2 == Z_FULL
  end
  z2
end

def shadow(z, a, b)
  z2 = z
  # z2 = shadow_up(z2, a - 1)
  (0...a).each do
    z2 |= (z2 >> W) + UP_BORDER
    return Z_FULL if z2 == Z_FULL
  end
  # return Z_FULL if z2 == Z_FULL
  # z2 = shadow_left(z2, b - 1)
  (0...b).each do
    z2 |= ((z2 & LEFT_MASK) >> 1) + LEFT_BORDER
    return Z_FULL if z2 == Z_FULL
  end
  z2
end

def check_a_b(a, b, abs, z)
  return false if H < a || W < b
  x = XS[a][b]

  # z2 = shadow(z, a, b)
  # return false if z2 == Z_FULL

  z2 = z
  (0...(a - 1)).each do
    z2 |= (z2 >> W) + UP_BORDER
    return false if z2 == Z_FULL
  end
  (0...(b - 1)).each do
    z2 |= ((z2 & LEFT_MASK) >> 1) + LEFT_BORDER
    return false if z2 == Z_FULL
  end

  z_a = z2.to_s(2).reverse.split('').map { |x| x == '1' }
  z_a.each_with_index do |z_ak, k|
    next if z_ak

    r = check_abs(abs, (x << k) | z)
    if r
      $tiles = [[a, b, k]] + $tiles if $debug
      return true
    end
  end
  false
end

def check_abs(abs, z)
  if z == Z_FULL
    $tiles = [] if $debug
    return true
  end
  return false if abs.empty?

  a, b = abs[0]

  # 回転なし
  return true if check_a_b(a, b, abs[1..-1], z)

  # 回転あり(bとaを入れ替える)
  if a != b
    return true if check_a_b(b, a, abs[1..-1], z)
  end

  false
end

def check
  (1..N).each do |n|
    ABS.combination(n).each do |abs|
      if abs.sum { |a, b| a * b } == H * W
        board = (1..H).map { Array.new(W, 0) }
        if check_abs(abs, 0)
          return true
        end
      end
    end
  end
  false
end

r = check

if r && $debug
  pp $tiles

  bgcolors = [40, 41, 42, 43, 44, 45, 46, 47]

  board = (1..H).map { Array.new(W, 0) }
  $tiles.each_with_index do |abk, c|
    a, b, k = abk
    i = k / W
    j = k % W
    (0...a).each do |i2|
      (0...b).each do |j2|
        board[i + i2][j + j2] = c
      end
    end
  end
  board.each do |line|
    puts line.map { |k| "\e[#{bgcolors[k]}m#{k}" }.join + "\e[0m"
  end
end

puts r ? 'Yes' : 'No'
