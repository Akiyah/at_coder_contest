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

T = STDIN.gets.chomp.to_i
ASS = (1..T).map do
  n = STDIN.gets.chomp.to_i
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(as)
  pp as if $debug
  n = as.length
  ds = [1000000] + (1...n).map { |i| as[i] - as[i - 1] } # 長さ n
  pp ds if $debug

  loop do
    return true if ds.all? { |d| 0 <= d }
    return false if ds.all? { |d| d <= 0 }
    
    j = ds.rindex { |d| 0 < d }
    i = ds.index { |d| d < 0 }

    pp ['i', i, 'j', j] if $debug

    return false unless i - 1 <= j

    ds[i] += 1
    ds[i + 1] -= 1 if i + 1 < n
    ds[j] -= 1
    ds[j + 1] += 1 if j + 1 < n

    pp ds if $debug
  end
end


ASS.each do |as|
  puts calc(as) ? 'Yes' : 'No'
end
