set adb=adb -e
set arch=x86
set pie=.pie
adb start-server
%adb% root
%adb% remount
rem %adb% shell mount -o remount,rw /system
%adb% shell setenforce 0

%adb% push %arch%/su%pie% /system/bin/su
%adb% shell chmod 0755 /system/bin/su
%adb% push %arch%/su%pie% /system/xbin/su
%adb% shell chmod 0755 /system/xbin/su
%adb% shell su --install
%adb% shell "su --daemon&"
%adb% install common/Superuser.apk
rem %adb% shell mount -o remount,ro /system
pause
#exit /b