def main():
  m, n = map(int, input().split())
  x = list(map(lambda x_: int(x_) - 1, input().split()))

  # dp[i][S]: 条件を満たすA[:i]のうち、末尾に付け加える事のできる
  # 文字集合がちょうどSであるものの個数
  dp = [0] * (1 << m)
  dp[-1] = 1

  # 集合Sの変化について:
  #   Bを末尾に追加した際、X[B] != BであればS -= {B}とする
  #   X[B'] = BとなるB'についてS += {B'}とする
  s_updater = {1 << i: sum(1 << j for j, x_ in enumerate(x) if x_ == i) for i in range(m)}

  for i in range(n):
      dp_updated = [0] * (1 << m)
      for s in range(1 << m):
          s_tmp = s
          while s_tmp:
              b = s_tmp & -s_tmp
              s_updated = (s & ~b) | s_updater[b]
              dp_updated[s_updated] = (dp_updated[s_updated] + dp[s]) % 998244353
              s_tmp -= b
      dp = dp_updated

  print(sum(dp) % 998244353)


if __name__ == '__main__':
  main()
