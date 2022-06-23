#Author: Bhargav

user=`echo $USER`
count=`rpm -qa|egrep -c "^wget|^jdk|^zip|^tree"`
if [[ $user != root ]]
then
echo "Ensure you are logged in as root user,to run the script..exiting the script now"
else
echo -e "Proceeding further to verify if required packages are installed"
        if [[ $count != 4 ]]
        then
echo "Required RPM Packages are not installed, install them manually....!"
else
        echo "Required packages are installed.. Proceeding with Maven package download and installation..!"
 wget https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.zip
# To verify if the file exist and not zero size
[ -s /opt/apache-maven-3.8.5-bin.zip ]
if [[ $? == 0 ]]
then
echo "Found apache-maven-3.8.5-bin.zip file for installation, proceeding further..!"
unzip apache-maven-3.8.5-bin.zip
sed -i -e '$aexport M2_HOME=/opt/apache-maven-3.8.5' ~/.bash_profile
sed -i -e '$aexport PATH=$PATH:$M2_HOME/bin' ~/.bash_profile
source ~/.bash_profile
mvn -version
echo "Maven Installed successfully"
else
echo "Found incorrect file for installation, check for correct file"
fi
fi
fi
