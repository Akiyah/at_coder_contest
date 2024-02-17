H, W, N = gets.chomp.split.map(&:to_i)
ts = gets.chomp.split('')
ss = (1..H).map do
  gets.chomp.split('').map { |s| s == '.' }
end
ss2 = ss.map do |line|
  r = 0
  line.each.with_index do |s, i|
    if s
      r += 2 ** (W - i - 1)
    end
  end
  ##pp r.to_s(2)
  r
end

ss0 = ss2.clone # base

def step(ts, ss2, ss0)
  di = dj = 0
  ts.each do |t|
    case t
    when 'U'
      di -= 1
    when 'D'
      di += 1
    when 'L'
      dj -= 1
    when 'R'
      dj += 1
    end

    if 0 <= di
      i_start = di
      i_end = H - 1 - di # < h - 1
    else
      i_start = -di
      i_end = H - 1
    end
    ((i_start)..(i_end)).each do |i|
      if 0 <= -dj
        ss2[i] &= (ss0[i + di] >> -dj)
      else
        ss2[i] &= (ss0[i + di] * (2 ** dj)) % (2 ** W)
      end
    end

    pp ss2
    ss2.each do |line|
      #pp line.to_s(2)
      puts sprintf("%+08b", line)
    end
  end
end

# #pp ss
# #pp points

# pp ss2
# ss2.each do |line|
#   #pp line.to_s(2)
#   puts sprintf("%+08b", line)
# end


step(ts, ss2, ss0)


result = ss2.sum do |line|
  # pp line.to_s(2)
  line.to_s(2).split('').count('1')
end
puts result