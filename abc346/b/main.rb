# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
W, B = STDIN.gets.chomp.split.map(&:to_i)


WB = 'wbwbwwbwbwbw'
WB100 = WB * 100

def check(w, b)
  (0..(WB.length - 1)).any? do |i|
    pp i if $debug
    j = i + (w + b)
    pp WB100[i...j] if $debug
    r = WB100[i...j].chars.group_by(&:itself).map { |k, v| [k, v.size] }.to_h
    pp r if $debug
    ((r['w'] == nil && w == 0) || r['w'] == w) && ((r['b'] == nil && b == 0) || r['b'] == b)
  end
end


puts check(W, B) ? 'Yes' : 'No'
