#!/usr/bin/env ruby

test_data = [
  { input: ['aacde', 'abcde'], expected: -1},
  { input: ['abcde', 'abcde'], expected:  0},
  { input: ['abcde', 'aabcd'], expected:  4},
  { input: ['bcdef', 'abcde'], expected:  5},
  { input: ['abcde', 'eabcd'], expected:  6},
  { input: ['abcde', 'aaaaa'], expected:  4},
  {
    input: [
      'abcdefghijklmnopqrstuvwxyz',
      'abcdefghijklmnopqrstuvwxyz',
    ],
    expected: 0,
  },
  {
    input: [
      'abcdefghijklmnopqrstuvwxyz',
      'bcdefghijklmnopqrstuvwxyza',
    ],
    expected: -1,
  },
  {
    input: [
      'abcdefghijklmnopqrstuvwxy',
      'bcdefghijklmnopqrstuvwxyz',
    ],
    expected: 25,
  },
  {
    input: [
      'abcdefghijklmnopqrstuvwxyz',
      'aaaaaaaaaaaaaaaaaaaaaaaaaa',
    ],
    expected: 25,
  },
  {
    input: [
      'abcdefghijklmnopqrstuvwxyz',
      'bcadefghijklmnopqrstuvwxyz',
    ],
    expected: -1,
  },
  {
    input: [
      'abcdefghijklmnopqrstuvwxyz',
      # abcde 0
      # adcde 1 b -> d
      # bdcde 2 a -> b
      # bdade 3 c -> a
      # bcace 4 d -> c
      # bcacd 5 e -> d
      'bcacdfghijklmnopqrstuvwxyz',
    ],
    expected: 5, # 3 + 2
  },
]

test_data.each do |test|
  input_file = 'input.txt'

  File.open(input_file, 'w') do |f|
    line0 = test[:input][0]
    line1 = test[:input][1]

    f.puts line0.length
    f.puts line0
    f.puts line1
  end

  command = "ruby main.rb < #{input_file}"
  output = `#{command}`

  pp({test:, command:, output:})

  if output.chomp == test[:expected].to_s
    puts 'OK'
  else
    puts 'NG'
  end
end

