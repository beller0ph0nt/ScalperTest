#/bin/bash

cd game
zip -9 -q -r ScalperTest.love .
cd ..
mv game/ScalperTest.love win
cd win
rm *.zip
wget https://bitbucket.org/rude/love/downloads/love-0.9.2-win32.zip
unzip love-0.9.2-win32.zip
rm love-0.9.2-win32.zip
cd love-0.9.2-win32
cat love.exe ./../ScalperTest.love > ScalperTest.exe
rm love.exe
cd ..
rm ScalperTest.love
mv love-0.9.2-win32/*.dll .
mv love-0.9.2-win32/*.exe .
mv love-0.9.2-win32/license.txt .
rm -r love-0.9.2-win32
zip -9 -q -r ScalperTest.zip .
rm *.exe
rm *.dll
rm *.txt
cd .\..
