clear
while :
do

 	figlet -w $(tput cols) -c 'FeedByMe' -f standard
	echo '-----------------------------------------------------------------------------------------------------------------------------------------------------'
      			
	echo ' '
	
	echo "Enter 1. to Login "
	echo "Enter 2. to Register"
	echo "Enter 0. to Exit "
	echo ' '
	echo "or, ctrl+c to terminate anytime!"
	
	echo ' '
      	echo '-----------------------------------------------------------------------------------------------------------------------------------------------------'
      			
	read choice

	if [[ $choice = 1 ]]
	then
		bash ./login.sh
		break
	
	elif [[ $choice = 2 ]]
	then
		bash ./registration.sh
		break
	
	
	elif [[ $choice = 0 ]]
	then
		break
	
	else
		clear
		echo "Wrong Input" 
	fi	
done	


