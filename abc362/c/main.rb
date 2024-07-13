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

N = STDIN.gets.chomp.to_i
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def check
  ls = LRS.map { |l, r| l }
  rs = LRS.map { |l, r| r }
  l_sum = ls.sum
  r_sum = rs.sum

  return false unless l_sum <= 0 && 0 <= r_sum

  d = 0 - l_sum

  xs = []
  N.times do |i|
    l = ls[i]
    r = rs[i]

    if 0 < d
      d0 = [d, r - l].min
      d = d - d0
      xs << l + d0
    else
      xs << l
    end    
  end

  xs
end


xs = check

if xs
  pp xs if $debug
  pp xs.sum if $debug

  puts 'Yes'
  puts xs.join(' ')
else
  puts 'No'
end