$debug = !ARGV[0].nil?


require 'set'

# 2つの点を通る直線の係数(a, b, c)を計算する
def calc_line(p1, p2)
  a = p2[1] - p1[1]
  b = p1[0] - p2[0]
  gcd = a.gcd(b)
  a /= gcd
  b /= gcd
  if a < 0 || (a == 0 && b < 0)
    a *= -1
    b *= -1
  end
  c = -(a * p1[0] + b * p1[1])
  [a, b, c]
end

def f(xys)
  n = xys.length
  majority = (n / 2) + 1
  ret = Set.new

  if n < 6
    (1...n).each do |i|
      (0...i).each do |j|
        a, b, c = calc_line(xys[i], xys[j])
        if xys.count { |x, y| a * x + b * y + c == 0 } >= majority
          ret << [a, b, c]
        end
      end
    end
    return ret.to_a
  end

  lines1 = f(xys[0...n/2])
  lines2 = f(xys[n/2...n])
  lines = lines1 + lines2

  lines.uniq.each do |a, b, c|
    if xys.count { |x, y| a * x + b * y + c == 0 } >= majority
      ret << [a, b, c]
    end
  end

  ret.to_a
end

# 入力処理
N = STDIN.gets.to_i
XYS = N.times.map { STDIN.gets.split.map(&:to_i) }

lines = f(XYS)
if lines.empty?
  puts 'No'
else
  puts 'Yes'
  a, b, c = lines[0]
  puts "#{a} #{b} #{c}"
end
