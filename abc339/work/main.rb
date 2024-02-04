N = gets.chomp.to_i # 2 ~ 60
BOARD = (1..N).map do |i|
  gets.chomp.split('')
end

STATUS = Array.new(64 * 64 * 64 * 64, nil)

N2 = N * N
N3 = N * N * N

def one_step(steps, s)
  new_steps = []
  steps.each do |p0i, p0j, p1i, p1j|
    s2i = (p0i << 18) + (p1i << 6)
    s2j = (p0j << 12) + p1j

    p0i_ = p0i - 1
    p1i_ = p1i - 1
    if p0i_ < 0 || BOARD[p0i_][p0j] == '#'
      p0i_ = p0i
    end
    if p1i_ < 0 || BOARD[p1i_][p1j] == '#'
      p1i_ = p1i
    end

    if p0i_ == p1i_ && p0j == p1j
      return [true, []]
    end

    # s2 = p0i_ * N3 + p0j * N2 + p1i_ * N + p1j
    s2 = s2j + (p0i_ << 18) + (p1i_ << 6)
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end


    p0i_ = p0i + 1
    p1i_ = p1i + 1
    if N <= p0i_ || BOARD[p0i_][p0j] == '#'
      p0i_ = p0i
    end
    if N <= p1i_ || BOARD[p1i_][p1j] == '#'
      p1i_ = p1i
    end

    if p0i_ == p1i_ && p0j == p1j
      return [true, []]
    end

    # s2 = p0i_ * N3 + p0j * N2 + p1i_ * N + p1j
    s2 = s2j + (p0i_ << 18) + (p1i_ << 6)
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end


    p0j_ = p0j - 1
    p1j_ = p1j - 1
    if p0j_ < 0 || BOARD[p0i][p0j_] == '#'
      p0j_ = p0j
    end
    if p1j_ < 0 || BOARD[p1i][p1j_] == '#'
      p1j_ = p1j
    end

    if p0i == p1i && p0j_ == p1j_
      return [true, []]
    end

    # s2 = p0i * N3 + p0j_ * N2 + p1i * N + p1j_
    # s2 = (p0i << 18) + (p0j_ << 12) + (p1i << 6) + p1j_
    s2 = s2i + (p0j_ << 12) + p1j_
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end


    p0j_ = p0j + 1
    p1j_ = p1j + 1
    if N <= p0j_ || BOARD[p0i][p0j_] == '#'
      p0j_ = p0j
    end
    if N <= p1j_ || BOARD[p1i][p1j_] == '#'
      p1j_ = p1j
    end

    if p0i == p1i && p0j_ == p1j_
      return [true, []]
    end

    #s2 = p0i * N3 + p0j_ * N2 + p1i * N + p1j_
    # s2 = (p0i << 18) + (p0j_ << 12) + (p1i << 6) + p1j_
    s2 = s2i + (p0j_ << 12) + p1j_
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end

  end

  [false, new_steps]
end

def calc
  ps = []
  BOARD.each.with_index do |row, i|
    row.each.with_index do |c, j|
      ps << [i, j] if c == 'P'
    end
  end
  

  p0i = ps[0][0]
  p0j = ps[0][1]
  p1i = ps[1][0]
  p1j = ps[1][1]
  
  # status[p0i * N3 + p0j * N2 + p1i * N + p1j] = 1
  STATUS[(p0i << 18) + (p0j << 12) + (p1i << 6) + p1j] = 1
  steps = [[p0i, p0j, p1i, p1j]]
  s = 0

  while true
    result, new_steps = one_step(steps, s)
    if result
      return s + 1
    end
    if new_steps.empty?
      return -1
    end

    # pp [s + 1, steps[s + 1].length]

    s += 1
    steps = new_steps
  end

end




puts calc


