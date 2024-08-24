# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

T = STDIN.gets.chomp.to_i
NKS = (1..T).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calk(n, k)
  m = [n, 2 ** k - 1].min
  as = (1..m).map do |i|
    s = i.to_s(2)
    pp [k, s] if $debug
    s2 = '0' + s.reverse + ((k - 1) > s.length ? '0' * ((k - 1) - s.length) : '')
    s2.tr!('0', 'o')
    s2.tr!('1', 'i')
    s2.tr!('i', '0')
    s2.tr!('o', '1')
    s2.to_i(2)    
  end

  if as.length < n
    as = as + [0] * (n - as.length) 
  end
  
  as
end


NKS.each do |n, k|
  puts calk(n, k).join(" ")
end
