#FTP
server=132.247.181.60
#port=21
#type: FTP
#Folder: /
U=carlos
P=c4rl0s1s44c

echo 'descargar figuras'

#find $fdir -type f -name "*QRO.csv"
#read -p "enter station code (eg. huan, piur, nazc): " st
declare -a st=("coe" "teo" "itu" "mex" "pla")
declare -a station=("coeneo" "teoloyucan" "iturbide" "mexico" "planetary")
read -p "Enter the initial date with the format (yyyymmdd): " idate

local_path="$HOME/reporte_lance/"

for i in ${!station[@]};do

	server_path="/data/output/plots/${station[$i]}/7days/"

	#scp [$U]host:[${server_path}] [$local_path${station[$i]}]

#	echo "${server_path}${st[$i]}_${idate}_07days.k.early.png"
	
	fnamek=" "
	fnameh=" "

	if [[ "${station[$i]}" != "planetary" ]];then
	        fnamek="${st[$i]}_${idate}_07days.k.early.png"
        	fnameh="${st[$i]}_${idate}_07days.dH.early.png"
        	#sshpass -p "$P" scp ${U}@${server}:${server_path}${fnamek} $local_path${station[$i]}
		echo 
	else
	        fnamek="${st[$i]}_${idate}_07days.k.png"
	        fnameh="${st[$i]}_${idate}_07days.dH.png"

	fi
	#echo "${server_path}${fnamek}"
	#echo "${server_path}${fnameh}"

	sshpass -p "$P" scp ${U}@${server}:${server_path}${fnamek} $local_path${station[$i]}
	sshpass -p "$P" scp ${U}@${server}:${server_path}${fnameh} $local_path${station[$i]}

	#scp ${U}@${server}:${server_path}${st[$i]}_${idate}_07days.k.early.png $local_path${station[$i]}

#        wget --ftp-user=$U --ftp-password=$P @ ftp://${server}${server_path}${st[$i]}_${idate}_07days.k.early.png -P $local_path${station[$i]}
done	

