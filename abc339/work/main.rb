N = gets.chomp.to_i # 2 ~ 60

PS = []
BOARD = (0...N).map do |i|
  gets.chomp.split('').map.with_index do |c, j|
    PS << [i, j] if c == 'P'
    c == '#'
  end
end

BOARD2 = [[true] * (N + 2)] + BOARD.map { |row| [true] + row + [true] } + [[true] * (N + 2)]

STATUS = Array.new(N * N * N * N, nil)

N2 = N * N
N3 = N * N * N

def one_step(steps, s)
  new_steps = []
  steps.each do |p0i, p0j, p1i, p1j|
    # up
    p0i_ = BOARD2[p0i][p0j + 1] ? p0i : p0i - 1
    p1i_ = BOARD2[p1i][p1j + 1] ? p1i : p1i - 1
    return [true, []] if p0i_ == p1i_ && p0j == p1j
    s2 = (p0i_ * N3) + (p0j * N2) + (p1i_ * N) + p1j
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end

    # down
    p0i_ = BOARD2[p0i + 2][p0j + 1] ? p0i : p0i + 1
    p1i_ = BOARD2[p1i + 2][p1j + 1] ? p1i : p1i + 1
    return [true, []] if p0i_ == p1i_ && p0j == p1j
    s2 = (p0i_ * N3) + (p0j * N2) + (p1i_ * N) + p1j
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i_, p0j, p1i_, p1j]
    end

    # left
    p0j_ = BOARD2[p0i + 1][p0j] ? p0j : p0j - 1
    p1j_ = BOARD2[p1i + 1][p1j] ? p1j : p1j - 1
    return [true, []] if p0i == p1i && p0j_ == p1j_
    s2 = (p0i * N3) + (p0j_ * N2) + (p1i * N) + p1j_
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end

    # right
    p0j_ = BOARD2[p0i + 1][p0j + 2] ? p0j : p0j + 1
    p1j_ = BOARD2[p1i + 1][p1j + 2] ? p1j : p1j + 1
    return [true, []] if p0i == p1i && p0j_ == p1j_
    s2 = (p0i * N3) + (p0j_ * N2) + (p1i * N) + p1j_
    if STATUS[s2] == nil
      STATUS[s2] = s + 1
      new_steps << [p0i, p0j_, p1i, p1j_]
    end
  end

  [false, new_steps]
end

def calc
  p0i, p0j = PS[0]
  p1i, p1j = PS[1]  
  STATUS[(p0i * N3) + (p0j * N2) + (p1i * N) + p1j] = 1
  steps = [[p0i, p0j, p1i, p1j]]
  s = 0

  while true
    result, new_steps = one_step(steps, s)
    return s + 1 if result
    return -1 if new_steps.empty?

    # pp [s + 1, new_steps.length]

    s += 1
    steps = new_steps
  end
end

puts calc
