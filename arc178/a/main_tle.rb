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

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }


N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

require 'set'

def check
  return [-1] if N == 1
  return [-1] if AS.include?(1)

  a_set = Set.new(AS)

  bs = (2..N).to_a
  ps = [1]
  p_max = 1

  p_set = Set.new(ps)
  i_set = Set.new([1])


  (2..N).each do |i|
    if a_set.include?(i)
      # rs = (1..i).to_a - ps
      if p_max <= i # rs.size == 1
        rs = i_set - p_set
        r = rs[0]
        if bs[0] == r
          if $debug
            pp "end" if bs.size == 1
          end
          return [-1] if bs.size == 1
          b = bs[1]
          bs.delete_at(1)
          ps.push(b)
          p_set.add(b)
          p_max = [p_max, b].max
        else
          b = bs.shift
          ps.push(b)
          p_set.add(b)
          p_max = [p_max, b].max
        end
      end
    else
      b = bs.shift
      ps.push(b)
      p_set.add(b)
      p_max = [p_max, b].max
    end
    i_set.add(i)

    pp ps if $debug
  end

  return ps
end

puts check.join(' ')




