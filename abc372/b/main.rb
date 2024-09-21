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


M = STDIN.gets.chomp.to_i


def calc(m)
  as = M.to_s(3).split('').map(&:to_i).reverse

  rs = []
  as.each_with_index do |a, i|
    if a == 1
      rs << i
    end
    if a == 2
      rs << i
      rs << i
    end
  end

  rs
end



rs = calc(M)
puts rs.length
puts rs.join(' ')
