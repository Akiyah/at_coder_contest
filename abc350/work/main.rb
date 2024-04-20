require "ac-library-rb/priority_queue"

$debug = !ARGV[0].nil?

N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)

pq = AcLibraryRb::PriorityQueue.new


$data = {}


# def calc_pq(pq) # 期待値を計算する


# end


def calc(n, d = 0) # 期待値を計算する
  if $data[n]
    puts "cache hit! n: #{n}" if $debug
    return $data[n]
  end

  # pq.push(n)
  # return calc_pq(pq)

  pp ("#{d}:" + " " * d) + "calc(#{n})" if $debug
  return 0 if n == 0

  # (1)
  u1 = X + calc(n / A, d + 1)
  pp ("#{d}:" + " " * d) + "u1 : #{u1}" if $debug

  # (2)
  u2 = (6 * Y + calc(n / 2, d + 1) + calc(n / 3, d + 1) + calc(n / 4, d + 1) + calc(n / 5, d + 1) + calc(n / 6, d + 1)) / 5.0
  # u2 = u1
  pp ("#{d}:" + " " * d) + "u2 : #{u2}" if $debug

  $data[n] = [u1, u2].min
  # $data[n] = u1
  pp $data if $debug
  $data[n]
end


puts calc(N)
