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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SI, SJ = STDIN.gets.chomp.split.map(&:to_i)
CS = (1..H).map do
  STDIN.gets.chomp.split('')
end
X = STDIN.gets.chomp


def calc
  
  s = [SI, SJ]
  pp s if $debug
  X.chars.each do |x|
    if x == 'L'
      if 1 < s[1] && CS[s[0] - 1][s[1] - 1 - 1] == '.'
        pp 'move' if $debug
        s[1] -= 1
      end
    end
    if x == 'R'
      if s[1] < W && CS[s[0] - 1][s[1] - 1 + 1] == '.'
        pp 'move' if $debug
        s[1] += 1
      end
    end
    if x == 'U'
      if 1 < s[0] && CS[s[0] - 1 - 1][s[1] - 1] == '.'
        pp 'move' if $debug
        s[0] -= 1
      end
    end
    if x == 'D'
      if s[0] < H && CS[s[0] - 1 + 1][s[1] - 1] == '.'
        pp 'move' if $debug
        s[0] += 1
      end
    end
    pp [x, s] if $debug
  end

  s
end

r = calc
puts r.join(' ')
