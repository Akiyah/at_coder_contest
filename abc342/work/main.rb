require "ac-library-rb/priority_queue"

N, M = gets.chomp.split.map(&:to_i)

diagrams = Hash.new do |hash, key|
  hash[key] = Hash.new { |hash, key| hash[key] = [] }
end
(1..M).map do
  l, d, k, c, a, b = gets.chomp.split.map(&:to_i)
  diagrams[b][a] << [l, d, k, c]
end

calced = {}
calcing = AcLibraryRb::PriorityQueue.new {|x, y| x[0] > y[0] }
f = Array.new(N - 1, 'Unreachable')

calcing.push([Float::INFINITY, N])

def calc(diagrams, calced, calcing, f)
  while !calcing.empty? do
    tb, b = calcing.pop
    next if calced[b]

    if diagrams[b]
      diagrams[b].each do |a, ldkcs|
        next if calced[a]
        ldkcs.each do |l, d, k, c|
          if tb == Float::INFINITY
            x = k - 1
            calcing.push([l + x * d, a])
          else
            if l <= tb - c
              x = [(tb - c - l) / d, k - 1].min
              calcing.push([l + x * d, a])
            end
          end
        end
      end
    end

    calced[b] = true
    f[b - 1] = tb
  end
end



calc(diagrams, calced, calcing, f)

puts f[0...(-1)].join("\n")