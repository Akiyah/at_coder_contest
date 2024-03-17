# require "ac-library-rb/segtree"

N, H, W = gets.chomp.split.map(&:to_i)
ABS = (1..N).map { gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
# pp ABS

Z_FULL = 2 ** (H * W) - 1

def check_a_b(a, b, abs, z)
  # pp ['check_a_b', a, b, abs, z.to_s(2)]
  x = (0...b).sum do |j|
    (2 ** a - 1) << j * H
  end
  (0..(H - a)).each do |i|
    (0..(W - b)).each do |j|
      y = (x << (j * H + i))
      if (y & z) == 0
        return true if check_ab(abs, y | z)
      end
    end
  end
  false
end

def check_ab(abs, z)
  # pp ['check_ab', abs, z.to_s(2)]
  return true if z == Z_FULL
  return false if abs.empty?

  a, b = abs[0]

  # return false if abs.sum { |a2, b2| a2 * b2 } < H * W - z.to_s(2).split('').count('1')


  # if a * b <= H * W - z.to_s(2).split('').count('1')
  # 回転なし
  return true if check_a_b(a, b, abs[1..-1], z)

  # 回転あり(bとaを入れ替える)
  if a != b
    return true if check_a_b(b, a, abs[1..-1], z)
  end

  # このタイルを使わない
  # check_ab(abs[1..-1], z)
end



def check
  z = 0 # board 2 digit H x W

  (1..N).each do |n|
    ABS.combination(n).each do |abs|
      if abs.sum { |a, b| a * b } == H * W
        return true if check_ab(abs, z)
      end
    end
  end
  false
end

puts check ? 'Yes' : 'No'