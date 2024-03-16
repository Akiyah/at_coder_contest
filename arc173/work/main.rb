# require "ac-library-rb/segtree"

T = gets.chomp.to_i
CASES = (1..T).map do
  gets.chomp.to_i
end

def nn?(n)
  ns = n.to_s.split('')
  (0...(ns.length - 1)).all? { |i| ns[i] != ns[i + 1] }
end

def g0(cs, c_top = nil)
  # pp "g0(#{cs}, #{c_top})"

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


MEMO = {}
G_COUNT = [0]
def g(c)
  pp "g(#{c}) : #{G_COUNT[0] += 1}"
  return MEMO[c] if MEMO[c]

  # pp "g(#{c})"
  MEMO[c] = g0(c.to_s.split('').map(&:to_i)) - 1
end

def create_answers
  n = 0
  [0] + (1..10000).to_a.map do |c|
    if nn?(c)
      n += 1
    end
    n
  end
end

# answers = create_answers
# p answers

# (0..100).each do |c|
#   pp [c, answers[c], g(c), answers[c] == g(c)] # if answers[c] != g(c)
# end



def f2(c, n1, n2) # g(n1) < c && c <= g(n2)
  pp "f2(#{c}, #{n1}, #{n2})"
  # pp [c, n1, n2]
  loop do # g(n - 1) == c - 1 && c == g(n) となるnを探す
    # pp [c, n1, n2]
    n = (n1 + n2) / 2
    gn = g(n)

    if gn == c && nn?(n)
      return n
    end

    if c <= gn
      n2 = n
    else
      n1 = n
    end
  end
end

def f(c)
  # g(n) = c となる n を探す

  # n1 = 0
  # n2 = c
  # while g(n2) < c do
  #   n1 = n2
  #   n2 = n2 * 2
  # end

  n1 = 0
  n2 = 3476050371420 + 1

  f2(c, n1, n2)
end

CASES.each do |c|
  # pp c
  puts f(c)
end
