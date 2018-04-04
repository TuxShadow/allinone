#!/bin/bash
#rdl

merah=$(tput setaf 1)
ijo=$(tput setaf 2)
dasar=$(tput sgr0)
biru=$(tput setaf 4)

xterm='xterm -hold -fa monaco -fs 10 -bg black -e nmap'
xterma='xterm -hold -fa monaco -fs 10 -bg black -e wpscan'
xtermb='xterm -hold -fa monaco -fs 10 -bg black -e whatweb'


echo -e "${biru}              0000_____________0000________0000000000000000__000000000000000000+\n            00000000_________00000000______000000000000000__0000000000000000000+\n           000____000_______000____000_____000_______0000__00______0+\n          000______000_____000______000_____________0000___00______0+\n         0000______0000___0000______0000___________0000_____0_____0+\n         0000______0000___0000______0000__________0000___________0+\n         0000______0000___0000______0000_________000___0000000000+\n         0000______0000___0000______0000________0000+\n          000______000_____000______000________0000+\n           000____000_______000____000_______00000+\n            00000000_________00000000_______0000000+\n              0000_____________0000________000000007\n Created By Aku;${dasar}"


echo -e "${ijo}1. Base 64 ${dasar}"
echo -e "${ijo}2. Base 32${dasar}"
echo -e "${ijo}3. SQLi scanner ${dasar}"
echo -e "${ijo}4. Enumerate User Wordpress ${dasar}"
echo -e "${ijo}5. Information Gathering Web ${dasar}"
echo -n "Masukan Pilihan : "

read pilihan 

 if [[ $pilihan = "1" ]]; then
 	echo "${biru}1.Decode ${dasar}"
 	echo "${merah}2.Encode ${dasar}"
 	echo "Anda akan apa ?"
 	read akan

 	if [[ $akan -eq 1 ]]; then
 		echo "Masukan yang akan di Decode : "
 		read decode
 		echo ${ijo} && echo $decode | base64 --decode && echo ${dasar}

 	elif [[ $akan -eq 2 ]]; then
 			echo "Masukan yang akan di encode : "
 			read encode
 			clear
 			echo ${ijo} && echo $encode | base64 && echo ${dasar}
 	fi

 


 fi

 if [[ $pilihan = "2" ]]; then
 	echo "${biru}1.Decode ${dasar}"
 	echo "${merah}2.Encode ${dasar}"
 	echo "Anda akan apa ?"
 	read akan

 	if [[ $akan -eq 1 ]]; then
 		echo "Masukan yang akan di Decode : "
 		read decode
 		echo ${ijo} && echo $decode | base32 --decode && echo ${dasar}

 	elif [[ $akan -eq 2 ]]; then
 			echo "Masukan yang akan di encode : "
 			read encode
 			clear
 			echo ${ijo} && echo $encode | base32 && echo ${dasar}
 	fi
 fi
if [[ $pilihan = "3" ]]; then
	which nmap > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo Nmap di temukan;

      clear
      echo "Masukan Target : "
      read inject
      $xterm -sV --script=http-sql-injection $inject
else

   echo Nmap Tidak Ditemukan ;
   echo ""
   echo Harap Tunggu ;
   apt-get update
   apt-get install nmap
   echo ""
   sleep 2
   exit
 fi


fi
if [[ $pilihan = "4" ]]; then
	which wpscan > /dev/null 2>&1
	if [[ "$?" -eq "0" ]]; then
		echo "Wpscan ditemukan"
          sleep 2
		clear
		echo "Masukan target : "
		read site
		$xterma -u $site --enumerate u
	else
		echo Harap Tunggu....;
		echo ""
		apt-get update
		apt-get install wpscan
		echo ""
		sleep 2
		exit
	fi
	
fi
if [[ $pilihan = "5" ]]; then
	which whatweb > /dev/null 2>&1
	if [[ "$?" -eq "0" ]]; then
		echo "Whatweb Ditemukan"
         sleep 2

		clear
		echo "Masukan Target : "
		read situs
		$xtermb -v $situs
	else
		echo Harap Tunggu....;
		echo ""
		add-apt-repository ppa:pi-rho/security
		apt-get update
		apt-get install whatweb
		echo ""
		sleep 2
		exit
	fi
fi
