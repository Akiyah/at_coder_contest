# require "ac-library-rb/segtree"

N, H, W = gets.chomp.split.map(&:to_i)
ABS = (1..N).map { gets.chomp.split.map(&:to_i) }.sort_by { |a, b| -a * b }
# pp ABS

Z_FULL = 2 ** (H * W) - 1

XS = (0..H).map do |a|
  (0..W).map do |b|
    (0...b).sum do |j|
      (2 ** a - 1) << j * H
    end
  end
end
# pp XS

def check_a_b(a, b, abs, z)
  # pp ['check_a_b', a, b, abs, z.to_s(2)]
  # x = (0...b).sum do |j|
  #   (2 ** a - 1) << j * H
  # end
  x = XS[a][b]
  #pp [x, x2] unless x == x2

  # z_a = z.to_s(2).split('')
  # pp z
  # pp z.to_s(2)
  # pp z_a
  # pp z_a.length
  # pp H * W - z_a.length
  # z_a = z_a + [0] * (H * W - z_a.length)
  # z_a.each_with_index do |d, k|
  #   next if d != 0
  #   next if H * W < k + (a * W + b)
  #   y = (x << k)
  #   if (y & z) == 0
  #     return true if check_ab(abs, y | z)
  #   end  
  # end

  (0..(H - a)).each do |i|
    (0..(W - b)).each do |j|
      # next if z_a[j * H + i] == 1
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

  # 回転なし
  return true if check_a_b(a, b, abs[1..-1], z)

  # 回転あり(bとaを入れ替える)
  if a != b
    return true if check_a_b(b, a, abs[1..-1], z)
  end
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