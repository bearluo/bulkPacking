
set keyStorePath=lib\iwapkkey
set keyAlias=shenzhen
set keyStorePassword=sziw0755
set keyAliasPassword=sziw0755

call lib/apktool.bat b -f -o bin/unalign.apk package
"lib/zipalign.exe" -f -v 4 bin/unalign.apk bin/unsign.apk
call lib/signapk.bat bin/out.apk bin/unsign.apk