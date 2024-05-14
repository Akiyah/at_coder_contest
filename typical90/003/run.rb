pp ARGV

def run(is)
  is = (1..) if is.empty?
  is.each do |i|
    input_file = "input#{i}.txt"
    expected_file = "expected#{i}.txt"
    actual_file = "actual/actual#{i}.txt"

    return unless File.exist?(input_file)

    command_main = "ruby main.rb < #{input_file} > #{actual_file}"
    pp command_main
    `#{command_main}`

    command_diff = "diff #{expected_file} #{actual_file}"
    result_diff = `#{command_diff}`

    if result_diff == ''
      puts 'diff OK'
    else
      puts command_diff
      puts result_diff
    end

  end
end

run(ARGV)