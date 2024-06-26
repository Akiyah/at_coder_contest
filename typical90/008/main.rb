
# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp

R = 10 ** 9 + 7

def calc
  ss = S.split('')
  as = 'atcoder'.split('')

  rs = Array.new(as.length + 1, 0)
  rs[0] = 1
  pp rs if $debug

  ss.each do |s|
    i = as.find_index(s)
    if i
      rs[i + 1] += rs[i]
      rs[i + 1] %= R
    end
    pp rs if $debug
  end

  rs[-1] % R
end

puts calc
