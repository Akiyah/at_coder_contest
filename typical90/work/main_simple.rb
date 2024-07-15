# require "ac-library-rb/segtree"
# include AcLibraryRb

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
DCSS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
pp DCSS if $debug


dcss = DCSS.sort_by { |d, c, s| d }
pp dcss if $debug

def calc(dcss, day = 0)
  return 0 if dcss.length == 0

  d, c, s = dcss[0]

  s1 = 0
  if day + c <= d # 今回のjobを行える
    s1 = s + calc(dcss[1..-1], day + c) # 今回のjobを行った場合
  end
  s2 = calc(dcss[1..-1], day) # 今回のjobを行わなかった場合

  return [s1, s2].max
end

puts calc(dcss)
