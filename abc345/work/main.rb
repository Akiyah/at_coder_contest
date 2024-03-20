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

def check_a_b(a, b, abs, z)
  return [false, nil] if H < a || W < b

  x = XS[a][b]
  z_a = z.to_s(2).split('')
  z_a = [0] * (H * W - z_a.length) + z_a
  # pp [z.to_s(2), z.to_s(2).length, z_a, H, W]

  z_a.each_with_index do |zk, k|
    i = k / W
    j = k % W
    next if H - a < i || W - b < j

    y = (x << k)
    if (y & z) == 0
      r, tiles = check_abs(abs, (y | z))
      if r
        return [true, [[a, b, i, j]] + tiles]
      end
    end
  end

  # (0..(H - a)).each do |i|
  #   (0..(W - b)).each do |j|
  #     y = (x << (i * W + j))
  #     if (y & z) == 0
  #       r, tiles = check_abs(abs, y | z)
  #       if r
  #         return [true, [[a, b, i, j]] + tiles]
  #       end
  #     end
  #   end
  # end
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
