N = gets.chomp.to_i # 2 ~ 60
board = (1..N).map do |i|
  gets.chomp.split('')
end

def one_step(steps, s, status, board)
  new_steps = []
  steps.each do |p0i, p0j, p1i, p1j|
    p0i_ = p0i - 1
    p1i_ = p1i - 1
    if p0i_ < 0 || board[p0i_][p0j] == '#'
      p0i_ = p0i
    end
    if p1i_ < 0 || board[p1i_][p1j] == '#'
      p1i_ = p1i
    end

    if p0i_ == p1i_ && p0j == p1j
      return [true, []]
    end

    s2 = p0i_ * N * N * N + p0j * N * N + p1i_ * N + p1j
    if status[s2] == nil
      status[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end


    p0i_ = p0i + 1
    p1i_ = p1i + 1
    if N <= p0i_ || board[p0i_][p0j] == '#'
      p0i_ = p0i
    end
    if N <= p1i_ || board[p1i_][p1j] == '#'
      p1i_ = p1i
    end

    if p0i_ == p1i_ && p0j == p1j
      return [true, []]
    end

    s2 = p0i_ * N * N * N + p0j * N * N + p1i_ * N + p1j
    if status[s2] == nil
      status[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end


    p0j_ = p0j - 1
    p1j_ = p1j - 1
    if p0j_ < 0 || board[p0i][p0j_] == '#'
      p0j_ = p0j
    end
    if p1j_ < 0 || board[p1i][p1j_] == '#'
      p1j_ = p1j
    end

    if p0i == p1i && p0j_ == p1j_
      return [true, []]
    end

    s2 = p0i * N * N * N + p0j_ * N * N + p1i * N + p1j_
    if status[s2] == nil
      status[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end


    p0j_ = p0j + 1
    p1j_ = p1j + 1
    if N <= p0j_ || board[p0i][p0j_] == '#'
      p0j_ = p0j
    end
    if N <= p1j_ || board[p1i][p1j_] == '#'
      p1j_ = p1j
    end

    if p0i == p1i && p0j_ == p1j_
      return [true, []]
    end

    s2 = p0i * N * N * N + p0j_ * N * N + p1i * N + p1j_
    if status[s2] == nil
      status[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end

  end

  [false, new_steps]
end

def calc(board)
  ps = []
  board.each.with_index do |row, i|
    row.each.with_index do |c, j|
      ps << [i, j] if c == 'P'
    end
  end
  
  status = Array.new(N * N * N * N, nil)

  p0i = ps[0][0]
  p0j = ps[0][1]
  p1i = ps[1][0]
  p1j = ps[1][1]
  
  status[p0i * N * N * N + p0j * N * N + p1i * N + p1j] = 1
  steps = [[p0i, p0j, p1i, p1j]]
  s = 0

  while true
    result, new_steps = one_step(steps, s, status, board)
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




puts calc(board)


