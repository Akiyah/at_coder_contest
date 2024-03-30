# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, A, B = STDIN.gets.chomp.split.map(&:to_i)
DS = STDIN.gets.chomp.split.map(&:to_i)

def check
  ds = DS.map { |d| d % (A + B) }.uniq.sort

  pp ds if $debug

  l = ds.length
  return true if l == 1

  d1 = ds[0]
  d2 = ds[-1]
  return true if d2 - d1 < A

  (1...l).each do |i|
    d1 = ds[i]
    d2 = ds[i - 1] + (A + B)
    pp [d1, d2] if $debug

    return true if d2 - d1 < A
  end

  false
end

puts check ? 'Yes' : 'No'
