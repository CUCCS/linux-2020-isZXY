# 实验报告3_201810413027
## asciinema录屏
### Systemd 入门教程：命令篇
1. [由来&Systemd 概述](https://asciinema.org/a/vmaMFWgJXFYrofD0d4qUJtCxq) 
2. [系统管理](https://asciinema.org/a/noKMqSx9vAXCD8yWwmMDTUdrv)
3. [Unit](https://asciinema.org/a/BfMFo64lxiImwxamDmdD1u7EN)
4. [Unit 的配置文件](https://asciinema.org/a/DbruexmxXD3i0BBhaEd8BPegU)
5. [Target&日志管理](https://asciinema.org/a/myW6vGvcX5PTQov1dBZ7aaoc2)


### Systemd 入门教程：实战篇
1. [开机启动&启动服务&停止服务](https://asciinema.org/a/4EwPpdbgYVOKjnqXBYdtd5Tsz)
2. [读懂配置文件&区块&修改配置文件](https://asciinema.org/a/m0asMXNOnfMxbrCUUO1dbpCUv)


## 自查清单
#### 如何添加一个用户并使其具备sudo执行程序的权限？
    ```
    sudo adduser username
    useradd username -m -s /bin/bash -d /home/username -g groupname
    sudo passwd username
    ```
```
vi etc//etc/sudoers
root ALL=(ALL:ALL) ALLusername ALL=(ALL:ALL) ALL
```
`:wq!`

#### 如何将一个用户添加到一个用户组？

`usermod -a -G groupname username`

#### 如何查看当前系统的分区表和文件系统详细信息？
 `fdisk -l`
  `df -lh`

#### 如何实现开机自动挂载Virtualbox的共享目录分区？
  
#### 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？

 root权限下：
* 动态扩容：
  + 逻辑卷LV扩容:` lvextend -L +容量+磁盘`;
  + 文件系统扩容:ext4文件系统扩容使用`resize2fs [逻辑卷名称]`，xfs文件系统扩容使用`xfs_growfs 挂载点"`
* 缩减容量：`lvreduce -L -r +容量+磁盘`

#### 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？

`ExecStartPost=指定脚本 start`

`ExecStopPost=另一个脚本 start`

#### 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

`sudo systemctl vi +脚本文件名` 

修改配置文件，restart字段设为`always`，保存。



## 困难
asciinema网站太难上去，难以修改名称
## 参考文献
[Systemd 入门教程：命令篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-commands.html)

[Systemd 入门教程：实战篇 by 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/03/systemd-tutorial-part-two.html)

[Beautifullyl的实验报告](https://github.com/CUCCS/linux-2020-Beautifullyl/blob/chap0x03/chap0x03/README.md)