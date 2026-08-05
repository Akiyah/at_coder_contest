
# N, M, Y = STDIN.gets.chomp.split.map(&:to_i)
# UVTS = (1..M).map do
#   STDIN.gets.chomp.split.map(&:to_i)
# end
# XS = STDIN.gets.chomp.split.map(&:to_i)


def run_test
  (2..10).each do |n|
    (0..10).each do |m|
      pp(n:, m:)

      10.times do |i|
        pp(i:)

        # n = rand(100) + 2
        # m = rand(n * (n - 1) / 2 + 1)
        # m = rand(100)
        y = rand(100) + 1
        # pp(i:, n:, m:, y:)
        uvts = []
        while uvts.length < m
          # pp(n:, m:, uvts:)
          u = rand(n) + 1
          v = rand(n) + 1
          t = rand(100) + 1
          next if u == v
          u, v = v, u unless u < v
          # next if uvts[[u, v]]
          uvts << [u, v, t]
          # pp(uvts:)
        end
        xs = n.times.map { rand(100) + 1 }
        # pp(i:, n:, m:, y:, xs:)

        File.open('test/sample.in', 'w') do |f|
          f.puts [n, m, y].join(' ')
          uvts.each do |u, v, t|
            f.puts [u, v, t].join(' ')
          end
          f.puts xs.join(' ')
        end
        
        o1 = `ruby main.rb < test/sample.in`
        o2 = `ruby main_simple.rb < test/sample.in`

        pp('o1 == o2' => o1 == o2)
        unless o1 == o2
          return
        end
      end
    end
  end
end


run_test