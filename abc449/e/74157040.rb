N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
Q = gets.to_i
X = readlines.map(&:to_i)
INF = 1<<60

require 'ac-library-rb/fenwick_tree'

class AcLibraryRb::FenwickTree
  def kth(x)
    ret = 0
    @step ||= 1 << (@size.bit_length - 1)
    step = @step
    while step > 0
      if ret + step < @size && @data[ret + step] < x
        x -= @data[ret + step]
        ret += step
      end
      step >>= 1
    end
    ret
  end
end

cnt = A.map(&:pred).tally; cnt.default = 0
evt = M.times.with_object(Array.new(N + 2){[]}){|i, evt| evt[cnt[i] + 1] << [1, i, -1]}
prt = (1..N + 1).each_with_object([0]){|i, prt| prt << prt[-1] + evt[i].size}
s = (1..N + 1).each_with_object(Array.new(N + 2, N)){|i, s| s[i] = s[i - 1] + prt[i]}
evt << []
prt << prt.last
s << INF
ans = Array.new(Q)
X.each_with_index do |x, i|
  j = s.bsearch_index{it >= x}
  if prt[j] == 0
    ans[i] = A[x - 1]
  else
    evt[j] << [2, (x - s[j - 1] - 1)%prt[j] + 1, i]
  end
end
ft = AcLibraryRb::FenwickTree.new(M)
evt.each do |e|
  e.each do |q, x, i|
    case q
    when 1
      ft.add(x, 1)
    when 2
      ans[i] = ft.kth(x) + 1
    end
  end
end
puts ans