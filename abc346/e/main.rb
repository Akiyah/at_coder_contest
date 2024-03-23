# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

H, W, M = STDIN.gets.chomp.split.map(&:to_i)
TAXS = (1..M).map { STDIN.gets.chomp.split.map(&:to_i) }

def calc
  painted_i = []
  painted_i_count = 0
  painted_j = []
  painted_j_count = 0

  counts = {}

  TAXS.reverse.each do |t, a, x|
    if t == 1
      if painted_i[a - 1]
      else
        if painted_j_count != W
          counts[x] ||= 0
          counts[x] += W - painted_j_count
        end
        painted_i_count += 1
        painted_i[a - 1] = true
      end
    else
      if painted_j[a - 1]
      else
        if painted_i_count != H
          counts[x] ||= 0
          counts[x] += H - painted_i_count
        end
        painted_j_count += 1
        painted_j[a - 1] = true
      end
    end
    if $debug
      pp "---"
      pp counts
      pp painted_i
      pp painted_i_count
      pp painted_j
      pp painted_j_count
    end
  end

  remain = H * W - counts.values.sum
  if 0 < remain
    counts[0] ||= 0
    counts[0] += remain
  end

  counts
end

b = calc

puts b.keys.count
b.keys.sort.each do |k|
  puts "#{k} #{b[k]}"
end
