#!/usr/bin/env python3
import sys
from math import gcd
from itertools import combinations
from pprint import pprint

# 入力読み取り
N = int(sys.stdin.readline().strip())
XYS = [tuple(map(int, sys.stdin.readline().split())) for _ in range(N)]

# 方向ベクトルを分類
ds = {}
for (x1, y1), (x2, y2) in combinations(sorted(XYS), 2):
    dx = x2 - x1
    dy = y2 - y1
    g = gcd(dx, dy)
    dx //= g
    dy //= g

    # Ruby の ds[dx][dy][g] に相当する辞書構造
    ds.setdefault(dx, {}).setdefault(dy, {}).setdefault(g, 0)
    ds[dx][dy][g] += 1

# 計算部分
r = 0
r_minus = 0
for dx, dys in ds.items():
    for dy, gs in dys.items():
        c_sum = 0
        for g, c in gs.items():
            c_sum += c
            r_minus += c * (c - 1) // 2
        r += c_sum * (c_sum - 1) // 2

# 出力
print(r - r_minus // 2)
