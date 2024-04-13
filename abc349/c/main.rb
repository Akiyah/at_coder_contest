# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp
T = STDIN.gets.chomp

ts = T.downcase.chars



def check(ts)
  if ts[2] == 'x'
    i0 = S.index(ts[0])
    return false if i0.nil?
    i1 = S.index(ts[1], i0 + 1)
    return false if i1.nil?
    true
  else
    i0 = S.index(ts[0])
    return false if i0.nil?
    i1 = S.index(ts[1], i0 + 1)
    return false if i1.nil?
    i2 = S.index(ts[2], i1 + 1)
    return false if i2.nil?
    true
  end
end

puts check(ts) ? "Yes" : "No"
