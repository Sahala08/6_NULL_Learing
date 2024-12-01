#!/bin/bash

# 定义 pidwait 函数
pidwait() {
    local pid=$1 # 获取传入的 PID 参数
    while kill -0 $pid 2>/dev/null; do
        sleep 1 # 每隔1秒检查一次进程是否存在
    done
    echo "Process $pid has completed."
}

# 示例用法
# 启动一个后台进程
sleep 60 &
# 记录该进程的 PID
local bg_pid=$!
# 调用 pidwait 函数等待后台进程完成
pidwait $bg_pid
# 当后台进程完成后执行 ls 命令
ls
