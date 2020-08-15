clear
while :
do
	
	figlet -w $(tput cols) -c 'FeedByMe' -f standard	
	echo "Enter Your User Name"
	read username

	chk_user=$(mysql feedbyme <<<"select * from feedbyme.user where user_name = '$username'")

	if [ -z "$chk_user" ]	
	then
		clear
   	echo "User Not Registered"

	else
		maxlimit=3;
		
		while : 
		do
		
			if [ $maxlimit -lt 1 ]
			then
				clear
				echo "You have Reached Maximum login limit!"
				figlet -w $(tput cols) -c 'FeedByMe' -f standard
				sleep 1
				break			
   		
			fi   		
   			
   			echo "Enter Your Password"
  			read -s password

   			chk_password=$(mysql feedbyme <<<"select * from feedbyme.user where user_name = '$username' AND password='$password'")
   
   			if [ -z "$chk_password" ]
  			then
  				
  					clear
  					figlet -w $(tput cols) -c 'FeedByMe' -f standard
      			echo "Incorrect Password!"
      			maxlimit=$((maxlimit-1))
   
   			else
   				
   					clear
						
						echo 'Logged in!'
						figlet -w $(tput cols) -c 'FeedByMe' -f standard
						echo ' '
						echo '-----------------------------------------------------------------------------------------------------------------------------------------------------'
      			echo ' '
      			
      			figlet -w $(tput cols) -c Hello, $username -f banner
      			
      			echo ' '
      			echo '-----------------------------------------------------------------------------------------------------------------------------------------------------'
      			
      			break
      		
   			fi
   	 	done
   	 	
   	  break	
	fi
done

echo " "
sleep 1

echo "Enter 1 to go to Main Menu." 
echo "or, Enter any key Exit."
read choice

if [ $choice == 1 ]
then
	bash ./main.sh
fi
	




