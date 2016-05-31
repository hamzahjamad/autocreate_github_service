 
 #!/bin/bash


runcurl(){
	username=$1 
	password=$2 
	reponame=$3 
	jenkinkurl=$4 

	sed -i "s/jkurl/$jenkinkurl/g" data.txt
	curl --user "$username:$password" -X POST --data @data.txt https://api.github.com/repos/$username/$reponame/hooks
	sed -i "s/$jenkinkurl/jkurl/g" data.txt



}



#
# Check input params
#
if [ -n "${1}" -a -n "${2}" -a -n "${3}" -a -n "${4}" ]; then
   
    runcurl $1 $2 $3 $4
else
    echo "Usage:"
    echo "  Please follow this convention: ${0} 'github_username' 'github_password' 'repository_name' 'jenkin_url'"
    exit 1
fi






