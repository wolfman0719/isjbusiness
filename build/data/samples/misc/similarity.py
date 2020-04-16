# -*- coding: utf-8 -*-

import unicodedata
import difflib
import sys

args = sys.argv

# unicodedata.normalize() で全角英数字や半角カタカナなどを正規化する
normalized_str1 = unicodedata.normalize('NFKC', args[1])
normalized_str2 = unicodedata.normalize('NFKC', args[2])

# 類似度を計算、0.0~1.0 で結果が返る
s = difflib.SequenceMatcher(None, normalized_str1, normalized_str2).ratio()
print(s)