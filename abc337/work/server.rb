require "open3"

100.times do
  n = rand(2..100)
  ans = rand(1..n)

  #pp [n, ans]

  Open3.popen3('ruby main.rb') do |input, output, err, status|
    input.puts n

    m = output.gets.chomp.to_i
    data = (1..m).map do |_i|
      output.gets.chomp.split.map(&:to_i)
    end
    #pp [m, data]

    result = data.map do |k, *as|
      as.include?(ans) ? 1 : 0
    end.join
    #pp result
    input.puts result

    ans2 = output.gets.chomp.to_i
    
    puts (ans == ans2 ? "OK n:#{n} ans:#{ans} ans2:#{ans2}" : "NG n:#{n} ans:#{ans} ans2:#{ans2}")
    #pp [ans, ans2]
  end
end
