#!/bin/bash

# 1. 确保精确杀死旧进程，避免脚本自杀
pkill -x swayidle

# 2. 全局参数 -w 和 -S 必须置于最前
# -w: 等待命令执行完成后再继续（防止指令堆积）
# -S: 忽略 D-Bus 抑制信号（解决你之前的 Line 277 错误）
swayidle -w -d \
    timeout 600 'qs -c noctalia-shell ipc call lockScreen lock' \
    timeout 3600 'qs -c noctalia-shell ipc call sessionMenu lockAndSuspend'
