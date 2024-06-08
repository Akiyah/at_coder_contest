# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7


$pow_cache = {}
def pow(n)
  $pow_cache[n] ||= 10.pow(n, B)
end

$bs_cache = {}
def bs(b0)
  return $bs_cache[b0] if $bs_cache[b0]

  bs = (0...B).map do |b1|
    b = (b0 + b1) % B
    [b1, b]
  end
  $bs_cache[b0] = bs
end


$rs_cache = {}
def calc_rs_nocache(n)
  if n == 0
    rs = Array.new(B, 0)
    rs[0] = 1
    return rs
  end

  if n == 1
    rs = Array.new(B, 0)
    CS.each do |c|
      rs[c % B] += 1
    end
    return rs
  end

  m = n.digits(2).length - 1
  n1 = 2 ** m
  n2 = n - n1
  if n2 == 0
    n1 = n2 = n / 2
  end

  # if n1.digits(2).all?(1)
  #   n1 = n * 2 / 3
  #   n2 = n - n1
  # end

  pp "n: #{n}, n1: #{n1}, n2: #{n2}" if $debug
  rs1 = calc_rs(n1)
  rs2 = calc_rs(n2)
  rs = Array.new(B, 0)
  p1 = pow(n1)
  B.times do |b2|
    b0 = (b2 * p1) % B
    r2 = rs2[b2]
    # bs(b0).each do |b1, b|
    #rs_ = Array.new(B, 0)
    B.times do |b|
      b1 = (-b0 + b) % B
      rs[b] = (rs[b] + r2 * rs1[b1]) % M
    end
  end
  rs
end

def calc_rs(n)
  pp "calc_rs(#{n})" if $debug
  $rs_cache[n] ||= calc_rs_nocache(n)
end

rs = calc_rs(N)
pp $rs_cache.keys if $debug
if $debug
  $rs_cache.keys.sort.each do |k|
    puts "k: #{k}, #{k.digits(2)}"
  end
end
pp $rs_cache.keys.count if $debug
puts rs[0] % M
