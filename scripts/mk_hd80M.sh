#!/bin/bash
dest=$1
sudo rm -rf $dest
sudo bximage -hd -mode="flat" -size=80 -q $dest
## 执行 expect 脚本
sudo expect<<-EOF
set timeout -1
spawn fdisk $dest
expect {
    "Command (m for help)" {send "n\n";exp_continue}
    "Select (default p)" {send "p\n";exp_continue}
    "Partition number (1-4, default 1)" {send "1\n";exp_continue}
    "default 2048)" {send "\n";exp_continue}
    "Last sector, +sectors or +size{K,M,G} (2048-163295, default 163295)" {send "163295\n"}
}
expect "Command (m for help)" {send "w\n";exp_continue} 
EOF
sudo fdisk -l  $dest

