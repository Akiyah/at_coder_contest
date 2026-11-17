#!/usr/bin/env python3
import sys
from bisect import bisect_left

# acc n ContestID
# oj t -c "python3 main.py" -d test
# acc s

# PyPyで高速化したい場合（再帰上限の緩和など）
# sys.setrecursionlimit(10**6)

debug = len(sys.argv) > 1

# 標準入力の読み込み
input_data = sys.stdin.read().split()
if not input_data:
    sys.exit()

N = int(input_data[0])
L = int(input_data[1])
R = int(input_data[2])
AS = [int(x) for x in input_data[3 : 3 + N]]

if debug:
    print(f"N={N}, L={L}, R={R}", file=sys.stderr)
    print(f"AS={AS}", file=sys.stderr)


def calc(ss, r, l):
    if debug:
        print(f"ss={ss}, r={r}, l={l}", file=sys.stderr)
    
    ans = 0
    # Rubyのコードに合わせて降順（大きい順）で管理するため、符号を反転させて昇順リストとして扱う
    # 元の ss2 = [0] に対応
    neg_ss2 = [0]

    for j in range(N):
        s_j = ss[j + 1]
        if debug:
            print(f"j={j}, s_j={s_j}", file=sys.stderr)

        # Ruby: ss2.bsearch_index { |s| s < s_j_r } || j + 1
        # s < target を探すのは、符号反転したリストで -s > -target を探す（bisect_right相当）のと同じ
        # ただし境界条件を合わせるため、s >= target の個数を数える
        s_j_r = s_j - r
        # neg_ss2 は昇順なので、-s_j_r より「真に大きい」最初のインデックス = s < s_j_r となる最初のインデックス
        i_r = bisect_left(neg_ss2, -s_j_r + 1)
        ans += i_r

        s_j_l_1 = s_j - (l - 1)
        i_l = bisect_left(neg_ss2, -s_j_l_1 + 1)
        ans -= i_l

        if debug:
            print(f"i_r={i_r}, i_l={i_l}, ans={ans}, ss2={[-x for x in neg_ss2]}", file=sys.stderr)

        # 降順を維持したまま s_j を挿入（符号反転リストに -s_j を挿入）
        i2 = bisect_left(neg_ss2, -s_j + 1)
        neg_ss2.insert(i2, -s_j)

        if debug:
            print(f"i2={i2}, ss2={[-x for x in neg_ss2]}", file=sys.stderr)

    return ans


# 累積和の計算
s = 0
ss = [0]
for a in AS:
    s += a
    ss.append(s)

if debug:
    print(f"ss={ss}", file=sys.stderr)

r = calc(ss, R, L)
if debug:
    print(f"r={r}", file=sys.stderr)

print(r)