# 进行输入参数的判断
# 参考了https://github.com/CUCCS/linux-2020-Beautifullyl/pull/4/files?file-filters%5B%5D=.jpg&file-filters%5B%5D=.md&file-filters%5B%5D=.png&file-filters%5B%5D=.sh&file-filters%5B%5D=.yml&file-filters%5B%5D=dotfile#diff-cb538001d35e1521040e0ad7d74b6334
# 太难了 我哭了
function helps {
    echo    "-r 批量重命名（统一添加文件名前缀或后缀，不影响原始文件扩展名）"
}

function rename 
    new_name=$1
	  for file in `ls $dir`
	    do
	     extension=${file##*.}
	     if [ $extension == "jpg" ] || [ $extension == "png" ] || [ $extension == "svg" ];then
		echo $file
		out=$dir/$new_name.${file##*.}
		echo $out
		convert $file $out
	     fi
	  done

}
while [[ "$#" -ne 0 ]]; do
	 case $1 in
		 "-r")   rename $2
			 shift 2;; 
		 "*")    echo "输入错误"
	esac
done

