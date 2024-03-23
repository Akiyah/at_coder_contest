# require "ac-library-rb/segtree"

N = gets.chomp.to_i

def check(d, cs, &block)
  return if d < 0
  return if cs.length < d
  if N == cs.length
    block.call(cs) if d == 0
    return
  end

  check(d + 1, cs + ['('], &block) 
  check(d - 1, cs + [')'], &block)
end

if N % 2 == 0
  check(0, []) { |cs| puts cs.join }
end
