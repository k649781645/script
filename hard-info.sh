#/bin/bash
HOSTNAME() {
echo "**************机器名称*****************************"
echo
echo            "主机名：`hostname`"
echo
}
HOSTNAME

cpu_info() {
echo "****************CPU_info******************************"
echo
echo "  CPU type:`cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c`"

echo "  CPU cores:`cat /proc/cpuinfo| grep "cpu cores"| uniq`"
echo
}
cpu_info

disk_info() {
echo "**********************************************"
echo
echo "Disk_number:`fdisk -l|grep 'Disk /dev/sd*'  |awk -F, '{print $1}' | wc -l`"
echo
echo "`fdisk -l|grep 'Disk /dev/sd*' | awk -F, '{print $1}' | sort`"
echo
echo "**********************************************"
echo "Partition info:"
echo
df -h | grep -v Filesystem | sed "s:none:${swap_pos}:"
echo
}
disk_info

mem_info () {
echo "****************Memory_info******************************"
echo
echo "  Memory total:`free -g`"
echo
}
mem_info