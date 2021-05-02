oldDate=`date +"tweets_%Y_%m_%d_%H_%M.txt"`
while [ 1=1 ]
do
	sleep 10
	if [ `ps -ef|grep "tweetsDownload\.py"|grep -v color|wc -l` -gt 0 ]; then
		echo "Downloader is running fine";
	else
		echo "Restarting downloader script";
		python3 tweetsDownload.py&
	fi
	newDate=`date +"tweets_%Y_%m_%d_%H_%M.txt"`
	if [ "$newDate" != "$oldDate" ]; then
		echo "Change detected $oldDate $newDate"
		#mkdir -p tweetsData
		zip $oldDate.zip $oldDate
		year=`echo $oldDate|cut -d'_' -f2`
		month=`echo $oldDate|cut -d'_' -f3`
		day=`echo $oldDate|cut -d'_' -f4`
		mkdir -p archives/tweetsData/$year/$month/$day/
		val=`mv $oldDate.zip archives/tweetsData/$year/$month/$day/$oldDate.zip`
		rm -rf $oldDate 
		oldDate=$newDate
	fi
done
