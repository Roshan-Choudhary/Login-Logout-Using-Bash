
clear

while :
do
	
	figlet -w $(tput cols) -c 'FeedByMe' -f standard
	echo "Enter First name"
	read firstName
	
	l=${#firstName}
	
	if [ $l -lt 1 ]
	then
		clear
		echo 'first name cannot be blank!'
		continue
	fi
	
	if [[ $firstName = +([a-zA-Z]) ]] #check if name name contains other than alphbets
	then
   		break
   		
   	else
   		clear
   		echo 'Name can only contain alphabets'	
   		continue
   	fi	
	
done

################################################################################################

clear

while :
do
	
	figlet -w $(tput cols) -c 'FeedByMe' -f standard
	echo "Enter Last name"
	read lastName
	
	l=${#lastName}
	
	if [ $l -eq 0 ] #Last name can be blank
	then
		break
	fi	
	
	if [[ $lastName = +([a-zA-Z]) ]]
	then
   		break
   		
   	else
   		clear
   		echo 'Name can only contain alphabets'	
   		continue
	fi

done
   		
################################################################################################

clear

while :
do
		figlet -w $(tput cols) -c 'FeedByMe' -f standard
		echo "Enter Email Id"
		read email
		
		if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]
		then
				break
		else
				clear
				echo 'Not A valid Email Id'
				continue
		fi		
		
					
done


################################################################################################

clear
number_check=1;

while :
do

		
	if [ $number_check -eq 1 ]
	then
		figlet -w $(tput cols) -c 'FeedByMe' -f standard
		echo "Enter Phone number"
		read phoneNumber
	else
		figlet -w $(tput cols) -c 'FeedByMe' -f standard
	  	echo "Enter a valid Phone number"	
		read phoneNumber
	fi
	
	re='^[0-9]+$'
	
	if ! [[ $phoneNumber =~ $re ]]
	then
		number_check=0
		clear
   		echo "A phone number must contain only numeric value"
		continue

	fi

	length=${#phoneNumber} #Find Bash String Length
	
	if [ $length -ne 10 ]
	then
		clear
		number_check=0
		echo "Phone Number can't be of length $length"
		continue
	fi
	
	break
done

################################################################################################

clear

while :
do
	figlet -w $(tput cols) -c 'FeedByMe' -f standard
	echo "Enter a User name"
	read userName

	check_user=$(mysql feedbyme <<<"select * from feedbyme.user where user_name = '$userName'")

	if [ -z "$check_user" ]
	then
		clear
		while :
		do
			figlet -w $(tput cols) -c 'FeedByMe' -f standard
   			echo "Enter a password"
   			read -s password
   		
   			l=${#password}
	
			if [ $l -lt 6 ]
			then
				clear
				echo "Password must be of minimum length 6"
				continue	   		
   			fi
   			
   			break
   		done
   	
   		mysql -e "INSERT INTO user values('$userName','$firstName','$lastName','$email','$password','$phoneNumber',CURRENT_TIMESTAMP)" feedbyme
	
		break
	
	else
		clear
   		echo "User name already taken!"
   		continue
	
	fi
done

################################################################################################

clear
figlet -w $(tput cols) -c 'FeedByMe' -f standard
echo "Registration Successful!"

echo " "
sleep 1

echo "Press 1 to goto Main page or Press any key Exit"
read choice

if [ $choice = 1 ]
then
	bash ./main.sh
fi
	



