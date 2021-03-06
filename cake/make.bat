@echo off
rem This file is automatically generated.

if "%1" == "roll" goto roll
if "%1" == "run" goto run
if "%1" == "rlong" goto rlong
if "%1" == "long" goto long
goto run

:roll
@echo on
@echo '(1st piece)'
ruby .\cake.rb -r=5 100 | ruby .\cut.rb -f=1 | ruby ..\histogram.rb -w=0.1
@echo '(3rd piece)'
ruby .\cake.rb -r=5 100 | ruby .\cut.rb -f=3 | ruby ..\histogram.rb -w=0.1
@echo off
goto end

:run
@echo on
ruby .\cake.rb 100 | ruby ..\monitor.rb | ruby ..\histogram.rb -w=0.1
@echo off
goto end

:rlong
@echo on
@echo '(1st piece)'
ruby .\cake.rb -r=5 10000 | ruby .\cut.rb -f=1 | ruby ..\histogram.rb -w=0.1 -u=100
@echo '(3rd piece)'
ruby .\cake.rb -r=5 10000 | ruby .\cut.rb -f=3 | ruby ..\histogram.rb -w=0.1 -u=100
@echo off
goto end

:long
@echo on
ruby .\cake.rb 10000 | ruby ..\histogram.rb -w=0.1 -u=100
@echo off
goto end

:end
