call init.bat
jarsigner -verbose -keystore "%keyStorePath%" -storepass "%keyStorePassword%" -signedjar %1 -digestalg SHA1 -sigalg MD5withRSA %2 "%keyAlias%" 