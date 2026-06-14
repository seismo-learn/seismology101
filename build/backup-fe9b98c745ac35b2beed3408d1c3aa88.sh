#!/usr/bin/env bash
#
#        目的： 使用 rsync 命令备份指定目录
#        作者： 姚家园、田冬冬
# 最近修改日期： 2021年2月2日
#
# 免责声明：
#   本脚本完全基于编写者在自己的计算机上备份文件的经验总结，
#   并不具备普遍适用性，仅供读者参考。
#

source="${HOME}"                   # 源目录
backup="/mnt/seismo-learn/backup"  # 备份目录（通常为移动硬盘的挂载目录）
log="${backup}/backup.log"         # 备份目录下的备份日志

# 检查源目录
if [ ! -d "${source}" ]; then        # 源目录不存在，退出程序
    echo "[${source}] does not exist!"
    exit
elif [ -z "$(ls ${source})" ]; then  # 源目录是空目录，退出程序
    echo "[${source}] is empty!"
    exit
fi

# 列出需要备份的目录
dirs=( ${source}/* )      # 备份源目录下所有子目录（不含隐藏目录和文件）
# dirs=(                  # 仅备份源目录下部分子目录
#     "${source}/src"
#     "${source}/software"
#     "${source}/codes"
# )

# 若备份目录不存在，则新建
mkdir -p "${backup}"

# 备份开始时间
echo "## Backup begins at $(date +%F-%H:%M:%S)" >> "${log}"

# 按序备份每个目录
for dir in "${dirs[@]}"; do
    echo -e "------------------------------------------\n"
    echo -e "Backup ${dir}\n"
    echo "Backup ${dir} at $(date +%F-%H:%M:%S)" >> "${log}"
    rsync -av --delete "${dir}" "${backup}"
done

# 备份结束时间
echo -e "## Backup ends at $(date +%F-%H:%M:%S)\n\n" >> "${log}"

# 检查备份目录下是否存在源目录下已删除的目录
echo -e "\n++++++++++++++++++++++++++++++++++++++++++++\n"
echo -e "Backup is finished! Begin to check!\n"
flag=1
dirs_backup=( ${backup}/* )
for dir_backup in "${dirs_backup[@]}"; do
    # 忽略备份日志
    dir_name=$(basename "${dir_backup}")
    if [ "${dir_backup}" = "${log}" ]; then
        continue
    fi

    # 备份目录下存在源目录下已删除的目录
    if [ ! -d "${source}/${dir_name}" ]; then
        echo "[${dir_name}] is deleted in [${source}] but is still in [${backup}]."
        flag=0
    fi
done

if [ ${flag} = 0 ]; then
    echo "You may choose to delete them in [${backup}] later."
else
    echo "Backup is successful!"
fi
