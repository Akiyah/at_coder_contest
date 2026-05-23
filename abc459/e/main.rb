#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

MOD = 998244353

N = STDIN.gets.chomp.to_i
PS = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)
DS = STDIN.gets.chomp.split.map(&:to_i)



$factorial_i = 0
$factorial_data = [1]
def factorial(n)
  if $factorial_i < n
    x = $factorial_data[$factorial_i]
    (($factorial_i + 1)..n).each do |i|
      x *= i
      x %= MOD
      $factorial_data[i] = x
    end
    $factorial_i = n
  end

  $factorial_data[n]
end

def inverse(n)
  n.pow(MOD - 2, MOD)
end

def combination(n, m)

  a = 1
  ((n - m + 1)..n).each do |i|
    a *= i
    a %= MOD
  end
  b = 1
  (1..m).each do |i|
    b *= i
    b %= MOD
  end
  a * inverse(b) % MOD

  # a1 = factorial(n)
  # a2 = factorial(m)
  # a3 = factorial(n - m)
  # ans = a1 * inverse(a2 * a3) % MOD
  # pp("combination(#{n}, #{m}) = #{ans}") if $debug
  # ans
end







parents = {}
childs = {}
PS.each.with_index do |p, i_2|
  parents[i_2 + 2] = p
  childs[p] ||= []
  childs[p] << i_2 + 2
end

pp(parents:) if $debug
pp(childs:) if $debug

def create_tree(parents, childs)
  tree = []
  tree[0] = [1]

  d = 0
  while true
    tree[d + 1] = []
    tree[d].each do |p|
      tree[d + 1] += childs[p] if childs[p]
    end
    if tree[d + 1].length == 0
      return tree[...-1]
    end
    d += 1
  end
end

tree = create_tree(parents, childs)
pp(tree:) if $debug



def calc(tree, parents, childs)
  remains = Array.new(N + 1, 0)
  patterns = Array.new(N + 1)
  depth = tree.length

  ((depth - 1)..0).step(-1).each do |d|
    pp(d:) if $debug
    nodes = tree[d]
    nodes.each do |node|
      child_remains_sum = 0
      if childs[node]
        child_remains_sum = childs[node].sum { |c| remains[c] }
      end
      n = CS[node - 1] + child_remains_sum
      m = DS[node - 1]
      return 0 if n < m
      
      patterns[node] = combination(n, m)
      remains[node] = n - m
    end
  end

  ans = 1
  patterns[1..].each do |pattern|
    ans *= pattern
    ans %= MOD
  end
  ans
end



puts calc(tree, parents, childs)

