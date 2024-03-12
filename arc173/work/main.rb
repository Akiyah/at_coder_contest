# require "ac-library-rb/segtree"

T = gets.chomp.to_i
CASES = (1..T).map do
  gets.chomp.to_i
end


def g0(cs, c_top = nil)
  if cs.length == 0
    # cs = [] なので、 0 < c_top として計算する
    return 1
  end

  d_top = cs[0]
  ds = cs[1..-1]
  k = ds.length

  result = 0

  if c_top == nil
    # 0
    result += (9 ** (k + 1) - 1) / (9 - 1)

    # 1...d_top
    # c_top が nil なので、 0 < d_top
    result += (d_top - 1) * (9 ** k)

    # d_top
    result += g0(ds, d_top)
  else
    # 0...d_top
    if c_top < d_top
      result += (d_top - 1) * (9 ** k)
    else
      result += d_top * (9 ** k)
    end

    # d_top
    result += g0(ds, d_top) if c_top != d_top
  end

  result
end


def g(c)
  g0(c.to_s.split('').map(&:to_i)) - 1
end

def create_answers
  n = 0
  [0] + (1..10000).to_a.map do |c|
    cs = c.to_s.split('')
    if (0...(cs.length - 1)).all? { |i| cs[i] != cs[i + 1] } 
      n += 1
    end
    n
  end
end

answers = create_answers
# p answers

(1..10000).each do |c|
  pp [c, answers[c], g(c), answers[c] == g(c)] if answers[c] != g(c)
end
