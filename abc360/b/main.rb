# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }

S, T = STDIN.gets.chomp.split(' ')
pp [S, T] if $debug

def check
  ss = S.split('')
  pp S.length if $debug
  (1..(S.length - 1)).each do |w|
    pp ['w', w] if $debug

    (0...w).each do |c|
      t = (0...(S.length)).map do |i|
        # pp i * w + c
        if i * w + c < S.length
          ss[i * w + c]
        else
          ''
        end
      end.join('')
      # pp [t, T, w, c, S]
      if t == T
        return true
      end
    end
  end
  false
end

puts check ? 'Yes' : 'No'
