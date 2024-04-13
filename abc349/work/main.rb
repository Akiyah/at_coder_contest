# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

L, R = STDIN.gets.chomp.split.map(&:to_i)


def calc_inner_2i(l, r, i)
  r_i = (r >> i)
  l_i = (l >> i)

  l2 = (l_i << i)
  l2 += (1 << i) if l2 < l
  r2 = l2 + (1 << i)

  if r < r2
    return nil
  end

  [l2, r2]
end

def divide(l, r)
  pp [l, r] if $debug
  d = r - l
  i = Math.log2(d).floor
  pp i if $debug

  s = calc_inner_2i(l, r, i)
  while s == nil
    i -= 1
    s = calc_inner_2i(l, r, i)
  end

  l2, r2 = s
  ss = [[l, l2], [l2, r2], [r2, r]]

  pp ss if $debug

  if l < l2
    ss = divide(l, l2) + ss[1..-1]
  else
    ss = ss[1..-1]
  end
  if r2 < r
    ss = ss[0...-1] + divide(r2, r)
  else
    ss = ss[0...-1]
  end

  return ss
end

ss = divide(L, R)

puts ss.length

ss.each do |l, r|
  puts [l, r].join(" ")
end
