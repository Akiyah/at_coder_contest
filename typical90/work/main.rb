# require "ac-library-rb/segtree"
# include AcLibraryRb

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
DCSS = (1..N).map do
  STDIN.gets.chomp.split(' ').map(&:to_i)
end
pp DCSS if $debug


dcss = DCSS.sort_by { |d, c, s| d }
pp dcss if $debug

def calc(dcss)

  dp = Hash.new(0)
  dp[0] = 0

  dcss.each do |d, c, s|
    dp_new = Hash.new(0)

    dp.each do |day_count, score|
      dp_new[day_count] = [dp_new[day_count], score].max
      if day_count + c <= d
        dp_new[day_count + c] = [dp_new[day_count + c], score + s].max
      end
    end

    dp = dp_new
  end


  return dp.values.max
end

puts calc(dcss)
