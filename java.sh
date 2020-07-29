yum install java-1.8* -y
if [ 0 -ne 0 = false ]; then
        echo "yum install failed"
        exit 1
else
        cd /usr/lib/jvm/
        ls -ld java-1.8.0-openjdk-1.8.0.*
        if [ $? -ne 0 ]; then
                echo "JAVA  1.8 not found in the JVM dir"
                exit 1
        else
                v_java=$(ls -ld java-1.8.0-openjdk-1.8.0.* | awk '{print $9}') ## where dynamic value is getting assigned to ENV variable
                                echo "export JAVA_HOME=/usr/lib/jvm/$v_java" >> $HOME/.bash_profile ## you can give double quotes so that variables will be replaced with values.
                echo 'export PATH=$JAVA_HOME/bin:$PATH' >> $HOME/.bash_profile ## you can give single quote so that variables will not be replaced with values.
                                source $HOME/.bash_profile  ## Source the bash_profile ENV file
        fi
        java -version
        echo 2 | alternatives --config java
        echo ""
        echo "JAVA 8 is installed Successfully"
fi
