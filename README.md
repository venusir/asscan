### 查找反代CF的IP

> https://fofa.info/

```
国内反代IP：server=="cloudflare" && port=="80" && header="Forbidden" && country=="CN"
剔除CF：asn!="13335" && asn!="209242"
阿里云：server=="cloudflare" && asn=="45102"
甲骨文韩国：server=="cloudflare" && asn=="31898" && country=="KR"
搬瓦工：server=="cloudflare" && asn=="25820"
```


### 二次筛选有效的反代CF的IP

> OpenBullet2：https://github.com/openbullet/OpenBullet2/releases/latest
> CF节点信息：/cdn-cgi/trace
> 机场三字码查询：http://airport.anseo.cn/

* loli脚本：

```
BLOCK:HttpRequest
  url = $"http://<input.DATA>/cdn-cgi/trace"
  maxNumberOfRedirects = 2
  customHeaders = {("Host", "cf.nicename.tk")}
  timeoutMilliseconds = 3000
  TYPE:STANDARD
  $""
  "application/x-www-form-urlencoded"
ENDBLOCK

BLOCK:Keycheck
  banIfNoMatch = False
  KEYCHAIN SUCCESS OR
    STRINGKEY @data.SOURCE Contains "h=cf.nicename.tk"
ENDBLOCK

```

### 常用优选IP地址

* [ymyuuu](https://ipdb.api.030101.xyz/) 

```
https://github.com/ymyuuu/IPDB #github地址
```

```
https://ipdb.api.030101.xyz/?type=bestproxy&country=true

```

* [cmliu](https://cf.090227.xyz/)

```
https://addressesapi.090227.xyz/ct
https://addressesapi.090227.xyz/cmcc
https://addressesapi.090227.xyz/CloudFlareYes
```

* OTC

```
https://ct.xxxxxxxx.tk/
https://cm.xxxxxxxx.tk/
https://cu.xxxxxxxx.tk/
https://cn.xxxxxxxx.tk/
```

### 相关参考博客及视频

* 反代IP优选、CDN-IP优选、CDN域名优选

  * [博客](https://www.smallstep.one/article/cf-cdn-ip-youxuan)
  * [视频](https://youtu.be/ngiXH9YuByQ)

* IP优选测速为什么为零、怎么获取可用测速链接、如何创建自己的测速地址

  * [博客](https://www.smallstep.one/article/ip-test-address)
  * [视频](https://youtu.be/-rOZEURBN20)

* 优选反代IP

  * [博客](https://bulianglin.com/archives/newcdn.html)
  * [视频](https://youtu.be/NbruiJShUCE)

* 优选订阅生成器
  * [视频](https://www.youtube.com/watch?v=p-KhFJAC4WQ)
  * [Github](https://github.com/cmliu/WorkerVless2sub)

* 优选IP全面讲解
  * [博客](https://tweek.top/archives/1710328114363)
  * [视频](https://www.youtube.com/watch?v=CkU5-SiSdoo)

### telegram频道

```
https://t.me/CF_NAT
```