# devops-charts
Charts for iii-devops

## Helm與Chart相關資料 Helm工具管理charts(package)
* [Helm: The package manager for Kubernetes](https://helm.sh/)

## iii-org 以chart為形式的專案範例
目前由於Serect 修改很大 因此下面專案可能無法通過


## 專案預設說明
* 專案預設採用NodePort，方便使用者可從外部進行透過PORT連線，但已支援網域名稱連線機制
* 於部屬的APP預設RELEASE名稱為專案與分支名稱

## 標準測試
* `helm3 lint ./charts/web-db/0.1.0 -f ./test.yaml`
* 前端與資料庫: `helm install --dry-run --debug ./charts/web-db/0.1.0 -f ./test/test.yaml  --generate-name`
* 前端整合: `helm install --dry-run --debug ./charts/web/0.1.0 -f ./test/testweb.yaml  --generate-name`
* 資料庫: `helm install --dry-run --debug ./charts/db/0.1.0 -f ./test/testdb.yaml  --generate-name`

## 快速專案模擬測試
* `flask-restful-app-template`: `helm install --dry-run --debug flask-restful-app-template-master ./charts/web/0.2.0 -f ./test/testweb-flask-restful-app-template.yaml`
