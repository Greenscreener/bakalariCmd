#/bin/bash
python3version=$(python3 -c 'import sys; print(sys.version_info[:])');
if [ $? != 0 ]; then
	python2version=$(python -c 'import sys; print(sys.version_info[:])');
	if [ $? != 0 ]; then 
		echo "Python not installed";
		printf "Which system do you use?\n0: Apt-based\n1: Pacman-based\n2: Zypper-based\n3: Other\n(0-3): "
		while true; do
			read operatingsystem;
			if [ $operatingsystem = 0 ]; then
				#APT CODE
				sudo apt install python3;
				break;
			elif [ $operatingsystem = 1 ]; then 
				#PACMAN CODE
				sudo pacman -Syu python3;
				break;
			elif [ $operatingsystem = 2 ]; then
				#ZYPPER CODE
				sudo zypper install python3;
				break;
			elif [ $operatingsystem = 3 ]; then 
				printf "Please install python3 manually.\n";
				exit 1;
				break;
			else
				printf "Please input numbers from 0 to 3.\n(0-3): "	
			fi
		done
	else
		echo "Python2 installed, but not python3 not."
		printf "Do you want to install python3?\n(y/n):"
		while true; do
			read yesno;
			if [ $yesno = y ]; then
				printf "Which system do you use?\n0: Apt-based\n1: Pacman-based\n2: Zypper-based\n3: Other\n(0-3): ";
				while true; do
					read operatingsystem;
					if [ $operatingsystem = 0 ]; then
						#APT CODE
						sudo apt install python3;
						break;
					elif [ $operatingsystem = 1 ]; then 
						#PACMAN CODE
						sudo pacman -Syu python3;
						break;
					elif [ $operatingsystem = 2 ]; then
						#ZYPPER CODE
						sudo zypper install python3;
						break;
					elif [ $operatingsystem = 3 ]; then 
						printf "Please install python3 manually.\n";
						exit 1;
						break;
					else
						printf "Please input numbers from 0 to 3.\n(0-3): "	
					fi
				done	
				break;
			elif [ $yesno = n ]; then 
				break;
			else 
				printf "Please input y or n.\n(y/n): ";
			fi
		done
	fi
fi
gitversion=$(git version);
if [ $? != 0 ]; then 
	echo "Git not installed";
	printf "Which system do you use?\n0: Apt-based\n1: Pacman-based\n2: Zypper-based\n3: Other\n(0-3): "
	while true; do
		read operatingsystem;
		if [ $operatingsystem = 0 ]; then
			#APT CODE
			sudo apt install git;
			break;
		elif [ $operatingsystem = 1 ]; then 
			#PACMAN CODE
			sudo pacman -Syu git;
			break;
		elif [ $operatingsystem = 2 ]; then
			#ZYPPER CODE
			sudo zypper install git;
			break;
		elif [ $operatingsystem = 3 ]; then 
			printf "Please install git manually.\n";
			exit 1;
			break;
		else
			printf "Please input numbers from 0 to 3.\n(0-3): "	
		fi
	done
fi
git clone --recurse-submodules https://github.com/vojta001/bakalariCmd;
cd bakalariCmd;
printf "Run 'python3 main.py' to start.\n";
exit 0;
