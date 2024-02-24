N, M = gets.chomp.split.map(&:to_i)
ldkcabs = (1..M).map do
  gets.chomp.split.map(&:to_i)
end

pp ldkcabs

diagrams = {}
ldkcabs.each do |l, d, k, c, a, b|
  diagrams[b] ||= {}
  diagrams[b][a] ||= []
  diagrams[b][a] << [l, d, k, c]
end

pp diagrams

calced = {}
calcing = {}
f = {}

calcing[N] = Float::INFINITY

def calc(diagrams, calced, calcing, f)
  while 0 < calcing.length do
    b = calcing.keys.max { |a, b| calcing[a] <=> calcing[b] }
    tb = calcing[b]

    if diagrams[b]
      diagrams[b].each do |a, ldkcs|
        next if calced[a]
        ldkcs.each do |l, d, k, c|
          if tb == Float::INFINITY
            x = k - 1
            calcing[a] = l + x * d
          else
            if l <= tb - c
              x = [(tb - c - l) / d, k - 1].min
              calcing[a] = l + x * d
            end
          end
        end
      end
    end

    calced[b] = true
    f[b] = tb
    pp f
    calcing.delete(b)
  end
end



calc(diagrams, calced, calcing, f)

pp f

