set package_name=%~nx1
set package_dir=%~dp1

lib/apktool.bat d -s -f -o package %package_dir%/%package_name%