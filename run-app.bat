@echo off
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.20.8-hotspot"
set "PATH=%JAVA_HOME%\bin;%PATH%"

echo Launching MindSpark Desktop Window...
java -jar target\MindSpark-1.0.0.jar
