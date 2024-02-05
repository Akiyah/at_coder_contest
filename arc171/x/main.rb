N = gets.chomp.to_i
S = gets.chomp
T = gets.chomp

ss = S.split('')
ts = T.split('')

def check(ss, ts)
  ss.index('A')
  ts.rindex('B')

  as = []
  bs = []

  ss.zip(ts).each_with_index do |(s, t), i|
    next if s == t

    as << i if s == 'A'
    bs << i if s == 'B'
  end

  # pp ss
  # pp ts
  # pp as
  # pp bs
  # pp ts.rindex('B')

  if 0 < bs.length # && ts.rindex('B') 
    return -1 unless ts.rindex('B') # ?
    return -1 if ts.rindex('B') <= bs[-1] 
  end
  if 0 < as.length # && ts.index('A')
    return -1 unless ts.index('A') # ?
    return -1 if as[0] <= ts.index('A')
  end

  i = 0
  c = 0
  bs.each do |b|
    j = as[i..-1].index { |a| b < a }
    # pp 'j'
    # pp j
    if j
      i += j + 1
      #as.delete_at(i)
      # pp [as, bs]
      c += 1
      # pp '[i, c]'
      # pp [i, c]
    end
  end

  # pp [as, bs]

  as.length + bs.length - c
end

puts check(ss, ts)
