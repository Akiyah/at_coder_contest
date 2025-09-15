def check_one(input_file_name, output_file_name)
  pp(input_file_name:, output_file_name:)
  command_main = if output_file_name
    "ruby main.rb < #{input_file_name} | diff #{output_file_name} -"
  else
    "ruby main.rb < #{input_file_name}"
  end
  # pp(command_main:)

  time_start = Time.now
  result = `#{command_main}`
  time_end = Time.now
  puts (time_end - time_start)
  if !output_file_name || result != ''
    puts result
  else
    puts 'OK'
  end
end

def check(dir, selected_input_file_names)
  pp(dir:, selected_input_file_names:)
  Dir.glob(dir + '/' + '*.in') do |input_file_name|
    if selected_input_file_names.length == 0 || selected_input_file_names.include?(input_file_name)
      output_file_name = input_file_name.gsub(/\.in\z/, '.out')
      output_file_name = nil unless File.exist?(output_file_name)
      check_one(input_file_name, output_file_name)
    end
  end
end

check('test', ARGV)
