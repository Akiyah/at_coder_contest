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

T = STDIN.gets.chomp.to_i



def normalize(a)
  pp(name: 'normalize', a:) if $debug
  cs = a.chars

  direction = nil
  step1 = 0
  step2 = 0
  step3 = 0
  es = []
  rs = []
  cs.each do |c|
    pp(c:) if $debug
    if c == '('
      if direction == 1
        step1 += 1
        es << c
      else # start
        # reset
        if 0 < step3
          if step1 < step3
            rs << 'xx' + ')' * (step3 - step1)
          else
            rs << '(' * (step1 - step3) + 'xx'
          end
        else
          rs << es
        end

        es = []

        direction = 1
        step1 = 1
        step2 = 0
        step3 = 0
        es << c
      end
    end
    if c == 'x'
      if direction == 1
        direction = 0
        step2 = 1
        es << c
      elsif direction == 0 && 0 < step2 && step2 < 2
        step2 += 1
        es << c
      else
        # reset
        if 0 < step3
          if step1 < step3
            rs << 'xx' + ')' * (step3 - step1)
          else
            rs << '(' * (step1 - step3) + 'xx'
          end
        else
          rs << es
        end
        rs << c

        es = []

        direction = nil
        step1 = 0
        step2 = 0
        step3 = 0
      end
    end
    if c == ')'
      if direction == 0 && step2 == 2
        direction = -1
        step3 = 1
        es << c
      elsif direction == -1
        step3 += 1
        es << c
      else
        # reset
        if 0 < step3
          if step1 < step3
            rs << 'xx' + ')' * (step3 - step1)
          else
            rs << '(' * (step1 - step3) + 'xx'
          end
        else
          rs << es
        end
        rs << c

        es = []

        direction = nil
        step1 = 0
        step2 = 0
        step3 = 0
      end
    end
    pp(rs:, es:, direction:, step1:, step2:, step3:) if $debug
  end

  # reset
  if 0 < step3
    if step1 < step3
      rs << 'xx' + ')' * (step3 - step1)
    else
      rs << '(' * (step1 - step3) + 'xx'
    end
  else
    rs << es
  end

  rs.flatten.join('')
end


def calc(a, b)
  pp(a:, b:) if $debug
  an = normalize(a)
  bn = normalize(b)
  pp(an:, bn:) if $debug
  an == bn
end



T.times do
  a = STDIN.gets.chomp
  b = STDIN.gets.chomp
  r = calc(a, b)
  puts r ? 'Yes' : 'No'
end

