cd .\game
zip -9 -q -r ScalperTest.love .
cd .\..
move game\ScalperTest.love win
cd .\win
copy /b "C:\Program Files\LOVE\love.exe" + ScalperTest.love ScalperTest.exe
del ScalperTest.love
copy "C:\Program Files\LOVE\*.dll" .
copy "C:\Program Files\LOVE\license.txt" .
zip -9 -q -r ScalperTest.zip .
del *.exe
del *.dll
del *.txt
cd .\..