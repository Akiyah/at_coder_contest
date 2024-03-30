# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, A, B = STDIN.gets.chomp.split.map(&:to_i)
DS = STDIN.gets.chomp.split.map(&:to_i)

def check_one(i)
  pp i if $debug
  DS.each do |d|
    pp [d, (d + i) % (A + B) < A, d + i, A + B, (d + i) % (A + B), A] if $debug
    return false unless (d + i) % (A + B) < A
  end
  true
end

def check
  (0...(A + B)).each do |i|
    return true if check_one(i)
  end
  false
end

puts check ? 'Yes' : 'No'
