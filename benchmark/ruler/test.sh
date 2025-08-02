#!/bin/bash

# 参数空间
A_values=(65536) # 16384 32768 
B_values=(
  niah_single_1 niah_single_2 niah_single_3
  niah_multikey_1 niah_multikey_2 niah_multikey_3
  niah_multivalue niah_multiquery
  cwe fwe qa_1 qa_2
)

# 固定参数
MODEL="llama-3.1-8b"
DATASET="synthetic"
METHOD="RetroInfer"
DTYPE="bf16"
T1="0.018"
T2="0.232"

# 遍历组合并执行 ruler_run.sh
for A in "${A_values[@]}"; do
  for B in "${B_values[@]}"; do
    echo "Running: bash ruler_run.sh $MODEL $DATASET $METHOD $A $B $DTYPE $T1 $T2"
    bash ruler_run.sh $MODEL $DATASET $METHOD $A $B $DTYPE $T1 $T2
  done
done