@echo off
java -cp JFlex.jar JFlex.Main simpleC.flex
javac -cp ;jflex.jar MyLexer.java
java -cp ;jflex.jar MyLexer %1