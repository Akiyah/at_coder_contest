# require "ac-library-rb/segtree"

T = gets.chomp.to_i
CASES = (1..T).map do
  gets.chomp.to_i
end


def g(c_top, cs)
  pp [c_top, cs]
  # if cs.length == 0
  #   return 1
  # end

  if cs.length == 1
    d_top = cs[0]
    return d_top if c_top == -1
    return d_top + 1 if d_top < c_top 
    return d_top
  end

  d_top = cs[0]
  ds = cs[1..-1]
  k = ds.length

  if c_top == -1
    result = 0
    #pp [result, k]
    # 0
    if k == 1
      result += 9
    else
      result += 10 * (9 ** (k - 1))
    end
    #pp [result, k]
    # 1...d_top
    result += (d_top - 1) * (9 ** k)
    #pp [result, k]
    # d_top
    result += g(d_top, ds)
    #pp [result, k]
    return result
  else
    result = 0
    #pp [result]
    # 0
    # result += 10 * (9 ** (k - 1)) if c_top != 0
    # 0...d_top
    if 0 <= c_top && c_top < d_top
      result += (d_top - 1) * (9 ** k)
      # #pp (d_top - 1) * (9 ** k)
    else
      result += d_top * (9 ** k)
      # #pp d_top * (9 ** k)
    end
    # d_top
    result += g(d_top, ds) if c_top != d_top
    #pp [result]
    return result
  end
end


pp g(-1, [9, 9, 9])
pp g(-1, [1, 0, 0, 0])

# #pp g(-1, [1])
# #pp g(-1, [9])

# #pp g(4, [5])
# #pp g(5, [5])
# #pp g(6, [5])

# #pp g(-1, [1, 0])
# #pp g(-1, [1, 0, 0])
# #pp g(-1, [1, 0, 0, 0])
# #pp g(-1, [1, 2, 3])

# #pp g(-1, [2, 3, 4])

# #pp g(-1, [2, 7])
# #pp g(-1, [1, 7, 3])
# #pp g(7, [3])
# #pp g(-1, 2506230721.to_s.split('').map(&:to_i))

# (1..1000).select do |c|
#   pp [c, g(-1, c.to_s.split('').map(&:to_i))]
# end



# CASES.each do |c|
#   cs = c.to_s.split('').map(&:to_i)
#   puts calc(cs)
# end

exit


n = 0
(1..1000).select do |c|
  cs = c.to_s.split('')
  l = cs.length
  if (0...(l - 1)).any? { |i| cs[i] == cs[i + 1] } 
    pp [c, '-']
  else
    n += 1
    pp [c, n]
  end
end
nil
