#!/bin/bash

start_message() {
echo "hello world"#start or stop docker script
echo "                                      "
echo " "
echo "this script start stop create or remove a docker container"
echo " ========================================"
echo "|                                        |"
echo "|  Plz press the appropriate number      |"
echo "|  1 -- To start  a docker container     |"
echo "|  2 -- To stop   a docker container     |"
echo "|  3 -- To Create a docker container     |"
echo "|  4 -- To Remove a docker container     |"
echo "|                                        |"
echo " ======================================== "
echo " "
echo " "
echo " "
echo " "
echo " "
read choice;
}

#check and start docker if needed
start_docker(){
sudo systemctl docker || systemctl start docker
}
#This function can be used to start the container will need container name
start_container () {
echo "Enter the name of docker container you want to start"
read container_name;
docker container start $container_name
}

stop_container () {
echo "Enter the name of docker container you want to stop"
read container_name
docker container stop	$container_name
echo " this is stop container implementation"
}

create_container () {
echo "this is create container implementation"
}
remove_container () {
echo "this is remove container implementation"
}

invalid_input() {
echo " your input is not valid "
}

start_message
case $choice in
  1) start_container;;
  2) stop_container;;
  3) create_container;;
  4) remove_container;;
  *) invalid_input  start_message;;
esac 
