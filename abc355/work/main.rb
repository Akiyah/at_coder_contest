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


N = STDIN.gets.chomp.to_i
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def count

  lr_ups = Hash.new(0)
  lr_downs = Hash.new(0)
  LRS.each do |l, r|
    lr_ups[l] += 1
    lr_downs[r] += 1
    # lr_keys << l
    # lr_keys << r
  end

  lr_keys = (lr_ups.keys + lr_downs.keys).uniq.sort

  # pp lr_keys if $debug
  # lr_keys.uniq!
  # lr_keys.sort!

  c = 0
  lines = 0
  lr_keys.each do |lr_key|
    lr_up = lr_ups[lr_key] || 0
    lr_down = lr_downs[lr_key] || 0

    pp [lr_key, lr_up, lr_down, lines] if $debug
    if 0 < lr_up

      c += lines * lr_up + (lr_up - 1) * lr_up / 2
      # c += (lines + lr_up) * (lines + lr_up + 1) / 2 - lines * (lines + 1) / 2
      lines += lr_up
    end

    lines -= lr_down

  end

  c
end

puts count
