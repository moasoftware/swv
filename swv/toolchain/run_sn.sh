#!/bin/sh
rm -rf src
java -jar AnnotationTerminator.jar -input /usr/local/SWV/dev/all_java_uci_ce/uci/MagnumChess_v4.00/src/magnumchess -output /usr/local/SWV/dev/src
#java -jar AnnotationTerminator.jar -input /root/sourcenavigator/java/Test -output /root/sourcenavigator/src
cd ./SNavi/bin/
rm -rf bin.proj
cd SNDB4
rm -rf *.*
rm -rf *
cd ../
rm -rf filelist.dat
echo /usr/local/SWV/dev/src > filelist.dat
./snavigator --batchmode --import filelist.dat
cd ../../
rm -rf recoveryDB.db
java -jar Extractinfo.jar -sndb "./SNavi/bin/SNDB4" -sndump "./SNavi/bin/dbdump"
java -jar Diagram.jar /usr/local/SWV/dev /usr/local/SWV/dev/graphviz/bin/dot
