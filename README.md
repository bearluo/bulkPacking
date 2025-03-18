#需要安装 
jdk-8u181-windows-x64
ant 环境

#bulkPacking
批量打包
##配置环境
https://github.com/shwenzhang/AndResGuard
apktool:  https://ibotpeaches.github.io/Apktool/    用于反编译apk包 和 重新打包
android sdk: 这个是用于对apk进行对齐操作的··· sdk\build-tools\19.1.0\zipalign.exe
jdk: 这个是用于对apk包进行签名

##使用

流程 : 反编译apk包 -> 修改包内容 -> 重新编译apk -> 打入签名 -> apk包对齐

最好对apktool ，android sdk ，jdk 都进行环境变量配置 这样就不用指定路径调用了
###apktool 使用:
decode: apktool d -f -o out.dir source.apk

encode: apktool b -f -o out.apk source.dir
``` javascript
usage: apktool
 -advance,--advanced   prints advance information.
 -version,--version    prints the version then exits
usage: apktool if|install-framework [options] <framework.apk>
 -p,--frame-path <dir>   Stores framework files into <dir>.
 -t,--tag <tag>          Tag frameworks using <tag>.
usage: apktool d[ecode] [options] <file_apk>
 -f,--force              Force delete destination directory.
 -o,--output <dir>       The name of folder that gets written. Default is apk.ou
t
 -p,--frame-path <dir>   Uses framework files located in <dir>.
 -r,--no-res             Do not decode resources.
 -s,--no-src             Do not decode sources.
 -t,--frame-tag <tag>    Uses framework files tagged by <tag>.
usage: apktool b[uild] [options] <app_path>
 -f,--force-all          Skip changes detection and build all files.
 -o,--output <dir>       The name of apk that gets written. Default is dist/name
.apk
 -p,--frame-path <dir>   Uses framework files located in <dir>.
```

###打入签名命令jarsigner使用
jarsigner -verbose -keystore [keystore.dir] -storepass <keystore.password> -signedjar [out.apk] -digestalg SHA1 -sigalg MD5withRSA [source.apk] [keystore.name]
``` javascript
用法: jarsigner [选项] jar 文件别名
       jarsigner -verify [options] jar-file [alias...]
[-keystore <url>]           密钥库位置
[-storepass <口令>]         用于密钥库完整性的口令
[-storetype <类型>]         密钥库类型
[-keypass <口令>]           私有密钥的口令 (如果不同)
[-certchain <file>]         替代 certchain 文件的名称
[-sigfile <文件>]           .SF/.DSA 文件的名称
[-signedjar <文件>]         已签名的 JAR 文件的名称
[-digestalg <算法>]        摘要算法的名称
[-sigalg <算法>]           签名算法的名称
[-verify]                   验证已签名的 JAR 文件
[-verbose[:suboptions]]     签名/验证时输出详细信息。
                            子选项可以是 all, grouped 或 summar
[-certs]                    输出详细信息和验证时显示证书
[-tsa <url>]                时间戳颁发机构的位置
[-tsacert <别名>]           时间戳颁发机构的公共密钥证书
[-altsigner <类>]           替代的签名机制的类名
[-altsignerpath <路径列表>] 替代的签名机制的位置
[-internalsf]               在签名块内包含 .SF 文件
[-sectionsonly]             不计算整个清单的散列
[-protected]                密钥库具有受保护验证路径
[-providerName <名称>]      提供方名称
[-providerClass <类>        加密服务提供方的名称
  [-providerArg <参数>]]... 主类文件和构造器参数
[-strict]                   将警告视为错误
```

###apk对齐zipalign
zipalign -f -v 4 unalign.apk align.apk
```javascript
Usage: zipalign [-f] [-v] <align> infile.zip outfile.zip
       zipalign -c [-v] <align> infile.zip

  <align>: alignment in bytes, e.g. '4' provides 32-bit alignment
  -c: check alignment only (does not modify file)
  -f: overwrite existing outfile.zip
  -v: verbose output
```


