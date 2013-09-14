#!/bin/bash
echo "_|    _|                      _|            _|                  _|"
echo "_|    _|    _|_|_|    _|_|_|  _|  _|        _|          _|_|_|  _|_|_|"
echo "_|_|_|_|  _|    _|  _|        _|_|          _|        _|    _|  _|    _|"
echo "_|    _|  _|    _|  _|        _|  _|        _|        _|    _|  _|    _|"
echo "_|    _|    _|_|_|    _|_|_|  _|    _|      _|_|_|_|    _|_|_|  _|_|_|"
echo "                                                                      "


IP_LOCAL=$(/sbin/ifconfig | sed -n '2 p' | awk '{print $2}' | cut -d':' -f 2)
while true; do
    read -p "Run insecure shell?" yn
    case $yn in
        [Nn]* )     
            echo " "
            
            echo "Meteoroid Docs: http://${IP_LOCAL}:8181"
                        
            echo " "            
            
            echo "Cloud9 IDE: http://${IP_LOCAL}:3131"
            
            echo "Secure Shell: https://${IP_LOCAL}:12320"
            
            echo "Webmin: https://${IP_LOCAL}:12321"
            
            
            echo "SSH/SFTP root@${IP_LOCAL} port 22"
            
            echo "Mongo DB mongo -u admin -p <password> ${IP_LOCAL}[/DB]"
            
            echo "RockMongo https://${IP_LOCAL}"
            
            /root/local/cloud9/bin/cloud9.sh -p 3131 -l 0.0.0.0 -w / > /dev/null &
            
            export MONGO_URL=mongodb://localhost:27017/meteoroid
            
            cd /root/local/meteoroid && mrt --port 8181 > /dev/null &
            exit;;
        [Yy]* )
            echo " "
            echo "Shell: http://${IP_LOCAL}:4200"
            echo " "
            echo "Use link above, Log in, and re-run startup command, then run secure shell"
            cd /root/local/shellinabox && ./shellinaboxd -t -q
        exit;;
        * ) echo "Please answer y or n.";;
    esac
done