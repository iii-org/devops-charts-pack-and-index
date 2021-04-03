# devops-charts
Charts for iii-devops

## Helm與Chart相關資料 Helm工具管理charts(package)
* [Helm: The package manager for Kubernetes](https://helm.sh/)

## [iii-org 以chart為形式的專案範例](https://github.com/iii-org/devops-charts/wiki/iii-org-%E4%BB%A5chart%E7%82%BA%E5%BD%A2%E5%BC%8F%E7%9A%84%E5%B0%88%E6%A1%88%E7%AF%84%E4%BE%8B)
目前由於Serect 修改很大 因此下面專案可能無法通過

## chart打包和更新方法(說明)
1. (前置需先安裝helm3)在專案根目錄下下面的指令
2. helm3 package charts/db/0.2.0/ <- 這個會打包db的0.2.0版本, 變成一個壓縮檔
3. helm3 package charts/db/0.3.0/ <- 這個會打包db的0.3.0版本, 變成一個壓縮檔
2. helm3 package charts/web/0.5.0/ <- 這個會打包db的0.5.0版本, 變成一個壓縮檔
3. .......
4. .......
5. .......
6. .......
7. .......
8. 逐一打包(每個chart)
9. helm3 repo index . <-這個會根據當下目錄內的chart壓縮檔, 建立索引清單的檔案(這個是最後的步驟)
10. 推回去commit 這樣就可以了
## chart打包和更新方法(範例)
```shell
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/devops-cronjob/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/devops-cronjob-0.1.0.tgz
helm3 package charts/scan-checkmarx/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/scan-checkmarx-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/test-postman/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/test-postman-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/test-zap/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/test-zap-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/db/0.2.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/db-0.2.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/db/0.2.1/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/db-0.2.1.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/db/0.3.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/db-0.3.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/db/0.3.1/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/db-0.3.1.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/devops-install/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/devops-install-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/scan-sonarqube/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/scan-sonarqube-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/test-webinspect/0.1.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/test-webinspect-0.1.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/web/0.3.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/web-0.3.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/web/0.4.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/web-0.4.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/web/0.5.0/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/web-0.5.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 package charts/web/0.5.1/
Successfully packaged chart and saved it to: /home/ubuntu/temp/devops-charts/web-0.5.1.tgz
ubuntu@csie406-222:~/temp/devops-charts$ helm3 repo index .
ubuntu@csie406-222:~/temp/devops-charts$ ls
LICENSE       db-0.3.0.tgz              index.yaml                test-webinspect-0.1.0.tgz  web-0.5.1.tgz
README.md     db-0.3.1.tgz              scan-checkmarx-0.1.0.tgz  test-zap-0.1.0.tgz
charts        devops-cronjob-0.1.0.tgz  scan-sonarqube-0.1.0.tgz  web-0.3.0.tgz
db-0.2.0.tgz  devops-install-0.1.0.tgz  test                      web-0.4.0.tgz
db-0.2.1.tgz  exp                       test-postman-0.1.0.tgz    web-0.5.0.tgz
ubuntu@csie406-222:~/temp/devops-charts$ git add *
ubuntu@csie406-222:~/temp/devops-charts$ git commit -m 'chart packaging and create index'
[main f4eab1f] chart packaging and create index
 16 files changed, 170 insertions(+)
 create mode 100644 db-0.2.0.tgz
 create mode 100644 db-0.2.1.tgz
 create mode 100644 db-0.3.0.tgz
 create mode 100644 db-0.3.1.tgz
 create mode 100644 devops-cronjob-0.1.0.tgz
 create mode 100644 devops-install-0.1.0.tgz
 create mode 100644 index.yaml
 create mode 100644 scan-checkmarx-0.1.0.tgz
 create mode 100644 scan-sonarqube-0.1.0.tgz
 create mode 100644 test-postman-0.1.0.tgz
 create mode 100644 test-webinspect-0.1.0.tgz
 create mode 100644 test-zap-0.1.0.tgz
 create mode 100644 web-0.3.0.tgz
 create mode 100644 web-0.4.0.tgz
 create mode 100644 web-0.5.0.tgz
 create mode 100644 web-0.5.1.tgz
ubuntu@csie406-222:~/temp/devops-charts$ git push -u origin main
Username for 'https://github.com': XXXXXXXX
Password for 'https://XXXXXXXX@github.com': 
Enumerating objects: 19, done.
Counting objects: 100% (19/19), done.
Delta compression using up to 32 threads
Compressing objects: 100% (18/18), done.
Writing objects: 100% (18/18), 144.11 KiB | 10.29 MiB/s, done.
Total 18 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/iii-org/devops-charts.git
   cc5887c..f4eab1f  main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```


## 專案預設說明
* 此chart非標準chart形式，因此無論用任何選項(用ClusterIP、Ingress、LoadBalance)都會有一個多出來的NodePort
* 專案預設採用NodePort，方便使用者可從外部進行透過PORT連線，但已支援網域名稱連線機制
* 於部屬的APP預設RELEASE名稱為專案與分支名稱

## 標準測試
* `helm3 lint ./charts/web-db/0.1.0 -f ./test.yaml`
* 前端與資料庫: `helm install --dry-run --debug ./charts/web-db/0.1.0 -f ./test/test.yaml  --generate-name`
* 前端整合: `helm install --dry-run --debug ./charts/web/0.1.0 -f ./test/testweb.yaml  --generate-name`
* 資料庫: `helm install --dry-run --debug ./charts/db/0.1.0 -f ./test/testdb.yaml  --generate-name`

## 快速專案模擬測試
* `flask-restful-app-template`: `helm install --dry-run --debug flask-restful-app-template-master ./charts/web/0.2.0 -f ./test/testweb-flask-restful-app-template.yaml`
